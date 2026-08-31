import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../interventions/domain/intervention.dart';
import '../../photos/domain/photo_asset.dart';
import '../../photos/domain/photo_repository.dart';
import '../domain/annotation_document.dart';
import '../domain/annotation_repository.dart';
import '../infrastructure/platform_annotation_gateway.dart';

class AnnotationEditorPage extends StatefulWidget {
  const AnnotationEditorPage({
    super.key,
    required this.intervention,
    required this.operation,
    required this.source,
    required this.repository,
    required this.photoRepository,
    this.gateway = const PlatformAnnotationGateway(),
  });
  final Intervention intervention;
  final DisassemblyOperation operation;
  final PhotoAsset source;
  final AnnotationRepository repository;
  final PhotoRepository photoRepository;
  final PlatformAnnotationGateway gateway;
  @override
  State<AnnotationEditorPage> createState() => _AnnotationEditorPageState();
}

class _AnnotationEditorPageState extends State<AnnotationEditorPage> {
  final _boundary = GlobalKey();
  var _tool = AnnotationTool.stroke;
  var _color = 0xFFFFC107;
  var _width = 4.0;
  var _busy = false;
  List<AnnotationElement> _elements = [];
  final List<List<AnnotationElement>> _undo = [], _redo = [];
  List<(double, double)>? _active;
  int? _selected;
  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final d = await widget.repository.findBySource(widget.source.id);
    if (mounted && d != null) setState(() => _elements = List.of(d.elements));
  }

  void _checkpoint() {
    _undo.add(List.of(_elements));
    if (_undo.length > 30) _undo.removeAt(0);
    _redo.clear();
  }

  (double, double) _normal(Offset p, Size s) =>
      ((p.dx / s.width).clamp(0, 1), (p.dy / s.height).clamp(0, 1));
  void _start(DragStartDetails d, Size s) {
    if (_tool == AnnotationTool.label || _tool == AnnotationTool.warning) {
      return;
    }
    final p = _normal(d.localPosition, s);
    if (_tool == AnnotationTool.select) {
      _selected = _nearest(p);
      setState(() {});
      return;
    }
    _checkpoint();
    _active = [p];
    setState(() {});
  }

  void _update(DragUpdateDetails d, Size s) {
    final p = _normal(d.localPosition, s);
    if (_tool == AnnotationTool.select && _selected != null) {
      final old = _elements[_selected!];
      final base = old.points.first;
      final dx = p.$1 - base.$1, dy = p.$2 - base.$2;
      _checkpoint();
      _elements[_selected!] = AnnotationElement(
        type: old.type,
        points: old.points.map((q) => (q.$1 + dx, q.$2 + dy)).toList(),
        text: old.text,
        color: old.color,
        width: old.width,
      );
      setState(() {});
      return;
    }
    if (_active != null) {
      if (_tool == AnnotationTool.stroke) {
        _active!.add(p);
      } else if (_active!.length == 1) {
        _active!.add(p);
      } else {
        _active![1] = p;
      }
      setState(() {});
    }
  }

  void _end(DragEndDetails d) {
    if (_active != null && _active!.isNotEmpty) {
      _elements.add(
        AnnotationElement(
          type: _tool,
          points: List.of(_active!),
          color: _color,
          width: _width,
        ),
      );
      _active = null;
      setState(() {});
    }
  }

  int? _nearest((double, double) p) {
    double best = .08;
    int? found;
    for (var i = 0; i < _elements.length; i++) {
      for (final q in _elements[i].points) {
        final d = math.sqrt(
          math.pow(q.$1 - p.$1, 2) + math.pow(q.$2 - p.$2, 2),
        );
        if (d < best) {
          best = d;
          found = i;
        }
      }
    }
    return found;
  }

  Future<void> _tap(TapUpDetails d, Size s) async {
    if (_tool != AnnotationTool.label && _tool != AnnotationTool.warning) {
      return;
    }
    final p = _normal(d.localPosition, s);
    var text = _tool == AnnotationTool.warning ? 'PRECAUCIÓN' : '';
    if (_tool == AnnotationTool.label) {
      final c = TextEditingController();
      final entered = await showDialog<String>(
        context: context,
        builder: (x) => AlertDialog(
          title: const Text('Etiqueta'),
          content: TextField(controller: c, autofocus: true),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(x),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(x, c.text.trim()),
              child: const Text('Añadir'),
            ),
          ],
        ),
      );
      if (entered == null || entered.isEmpty) return;
      text = entered;
    }
    _checkpoint();
    setState(
      () => _elements.add(
        AnnotationElement(
          type: _tool,
          points: [p],
          text: text,
          color: _color,
          width: _width,
        ),
      ),
    );
  }

  Future<AnnotationDocument> _save() async {
    final d = await widget.repository.saveDraft(
      sourcePhotoId: widget.source.id,
      canvasWidth: widget.source.width,
      canvasHeight: widget.source.height,
      elements: _elements,
    );
    await widget.gateway.saveDraft(
      root: widget.intervention.rootDocumentUri,
      folder: widget.intervention.folderName,
      operationCode: widget.operation.code,
      json: d.elementsJson,
    );
    return d;
  }

  Future<void> _export() async {
    setState(() => _busy = true);
    try {
      final d = await _save();
      final boundary =
          _boundary.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 1.5);
      final data = await image.toByteData(format: ui.ImageByteFormat.png);
      image.dispose();
      final captured = await widget.gateway.export(
        root: widget.intervention.rootDocumentUri,
        folder: widget.intervention.folderName,
        operationCode: widget.operation.code,
        json: d.elementsJson,
        renderedPng: data!.buffer.asUint8List(),
      );
      final photo = await widget.photoRepository.save(
        interventionId: widget.intervention.id,
        operationId: widget.operation.id,
        kind: OperationPhotoKind.annotated,
        captured: captured,
        sourcePhotoId: widget.source.id,
      );
      await widget.repository.markRendered(d.id, photo.id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Copia B anotada exportada.')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('No se pudo exportar: $e')));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('${widget.operation.code} · Anotar fotografía A'),
    ),
    body: Column(
      children: [
        _toolbar(),
        Expanded(
          child: LayoutBuilder(
            builder: (context, c) {
              final size = Size(c.maxWidth, c.maxHeight);
              return GestureDetector(
                onPanStart: (d) => _start(d, size),
                onPanUpdate: (d) => _update(d, size),
                onPanEnd: _end,
                onTapUp: (d) => _tap(d, size),
                child: RepaintBoundary(
                  key: _boundary,
                  child: CustomPaint(
                    foregroundPainter: _AnnotationPainter([
                      ..._elements,
                      if (_active != null)
                        AnnotationElement(
                          type: _tool,
                          points: _active!,
                          color: _color,
                          width: _width,
                        ),
                    ], _selected),
                    child: SizedBox.expand(
                      child: Image.file(
                        File(widget.source.thumbnailPath),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _busy
                        ? null
                        : () async {
                            setState(() => _busy = true);
                            try {
                              if (!mounted) return;
                              ScaffoldMessenger.of(this.context).showSnackBar(
                                const SnackBar(
                                  content: Text('Borrador JSON guardado.'),
                                ),
                              );
                            } finally {
                              if (mounted) setState(() => _busy = false);
                            }
                          },
                    icon: const Icon(Icons.save_outlined),
                    label: const Text('Guardar borrador'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _busy || _elements.isEmpty ? null : _export,
                    icon: _busy
                        ? const SizedBox.square(
                            dimension: 20,
                            child: CircularProgressIndicator(),
                          )
                        : const Icon(Icons.ios_share),
                    label: const Text('Exportar B anotada'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  Widget _toolbar() => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.all(8),
    child: Row(
      children: [
        for (final t in AnnotationTool.values)
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: ChoiceChip(
              selected: _tool == t,
              onSelected: (_) => setState(() => _tool = t),
              avatar: Icon(_icon(t)),
              label: Text(_label(t)),
            ),
          ),
        IconButton.filledTonal(
          tooltip: 'Deshacer',
          onPressed: _undo.isEmpty
              ? null
              : () {
                  _redo.add(List.of(_elements));
                  setState(() => _elements = _undo.removeLast());
                },
          icon: const Icon(Icons.undo),
        ),
        IconButton.filledTonal(
          tooltip: 'Rehacer',
          onPressed: _redo.isEmpty
              ? null
              : () {
                  _undo.add(List.of(_elements));
                  setState(() => _elements = _redo.removeLast());
                },
          icon: const Icon(Icons.redo),
        ),
        IconButton.filledTonal(
          tooltip: 'Borrar elemento',
          onPressed: _selected == null
              ? null
              : () {
                  _checkpoint();
                  setState(() {
                    _elements.removeAt(_selected!);
                    _selected = null;
                  });
                },
          icon: const Icon(Icons.delete_outline),
        ),
        PopupMenuButton<int>(
          tooltip: 'Color',
          icon: Icon(Icons.palette, color: Color(_color)),
          onSelected: (v) => setState(() => _color = v),
          itemBuilder: (_) => [0xFFFFC107, 0xFFF44336, 0xFF2196F3, 0xFFFFFFFF]
              .map(
                (v) => PopupMenuItem(
                  value: v,
                  child: Icon(Icons.circle, color: Color(v)),
                ),
              )
              .toList(),
        ),
        DropdownButton<double>(
          value: _width,
          onChanged: (v) => setState(() => _width = v!),
          items: [2, 4, 8, 12]
              .map(
                (v) => DropdownMenuItem(
                  value: v.toDouble(),
                  child: Text('${v}px'),
                ),
              )
              .toList(),
        ),
      ],
    ),
  );
  String _label(AnnotationTool t) => const {
    AnnotationTool.select: 'Mover',
    AnnotationTool.stroke: 'Trazo',
    AnnotationTool.arrow: 'Flecha',
    AnnotationTool.label: 'Etiqueta',
    AnnotationTool.warning: 'Precaución',
  }[t]!;
  IconData _icon(AnnotationTool t) => const {
    AnnotationTool.select: Icons.open_with,
    AnnotationTool.stroke: Icons.gesture,
    AnnotationTool.arrow: Icons.arrow_right_alt,
    AnnotationTool.label: Icons.text_fields,
    AnnotationTool.warning: Icons.warning_amber,
  }[t]!;
}

class _AnnotationPainter extends CustomPainter {
  _AnnotationPainter(this.items, this.selected);
  final List<AnnotationElement> items;
  final int? selected;
  @override
  void paint(Canvas c, Size s) {
    for (var i = 0; i < items.length; i++) {
      final e = items[i],
          p = Paint()
            ..color = Color(e.color)
            ..strokeWidth = e.width
            ..style = PaintingStyle.stroke
            ..strokeCap = StrokeCap.round;
      Offset o((double, double) q) => Offset(q.$1 * s.width, q.$2 * s.height);
      if (e.type == AnnotationTool.stroke) {
        final path = Path();
        if (e.points.isNotEmpty) {
          path.moveTo(o(e.points.first).dx, o(e.points.first).dy);
          for (final q in e.points.skip(1)) {
            path.lineTo(o(q).dx, o(q).dy);
          }
          c.drawPath(path, p);
        }
      } else if (e.type == AnnotationTool.arrow && e.points.length > 1) {
        final a = o(e.points[0]), b = o(e.points[1]);
        c.drawLine(a, b, p);
        final angle = math.atan2(b.dy - a.dy, b.dx - a.dx);
        c.drawLine(b, b - Offset.fromDirection(angle - .6, 18), p);
        c.drawLine(b, b - Offset.fromDirection(angle + .6, 18), p);
      } else if (e.points.isNotEmpty) {
        final at = o(e.points.first);
        if (e.type == AnnotationTool.warning) {
          c.drawCircle(at, 18, p);
          final tp = TextPainter(
            text: TextSpan(
              text: '!',
              style: TextStyle(
                color: Color(e.color),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          tp.paint(c, at - Offset(tp.width / 2, tp.height / 2));
        }
        if (e.text.isNotEmpty) {
          final tp = TextPainter(
            text: TextSpan(
              text: e.text,
              style: TextStyle(
                color: Color(e.color),
                fontSize: 22,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.black54,
              ),
            ),
            textDirection: TextDirection.ltr,
          )..layout(maxWidth: s.width - at.dx);
          tp.paint(c, at + const Offset(20, 0));
        }
      }
      if (i == selected && e.points.isNotEmpty) {
        c.drawCircle(
          o(e.points.first),
          12,
          Paint()
            ..color = Colors.white
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _AnnotationPainter old) => true;
}
