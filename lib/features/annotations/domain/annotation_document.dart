import 'dart:convert';

enum AnnotationTool { select, stroke, arrow, label, warning }

class AnnotationElement {
  const AnnotationElement({
    required this.type,
    required this.points,
    this.text = '',
    this.color = 0xFFFFC107,
    this.width = 4,
  });
  final AnnotationTool type;
  final List<(double, double)> points;
  final String text;
  final int color;
  final double width;
  Map<String, Object> toJson() => {
    'type': type.name,
    'points': points.map((p) => {'x': p.$1, 'y': p.$2}).toList(),
    'text': text,
    'color': color,
    'width': width,
  };
  factory AnnotationElement.fromJson(Map<String, Object?> json) =>
      AnnotationElement(
        type: AnnotationTool.values.byName(json['type']! as String),
        points: (json['points']! as List).map((p) {
          final v = p as Map;
          return ((v['x'] as num).toDouble(), (v['y'] as num).toDouble());
        }).toList(),
        text: json['text'] as String? ?? '',
        color: json['color'] as int? ?? 0xFFFFC107,
        width: (json['width'] as num?)?.toDouble() ?? 4,
      );
}

class AnnotationDocument {
  const AnnotationDocument({
    required this.id,
    required this.sourcePhotoId,
    required this.canvasWidth,
    required this.canvasHeight,
    required this.elements,
    required this.updatedAt,
    this.renderedPhotoId,
  });
  final String id;
  final String sourcePhotoId;
  final int canvasWidth;
  final int canvasHeight;
  final List<AnnotationElement> elements;
  final String? renderedPhotoId;
  final DateTime updatedAt;
  String get elementsJson =>
      jsonEncode(elements.map((e) => e.toJson()).toList());
}
