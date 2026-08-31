import 'package:flutter/material.dart';

import '../domain/intervention.dart';

class NewInterventionPage extends StatefulWidget {
  const NewInterventionPage({super.key});

  @override
  State<NewInterventionPage> createState() => _NewInterventionPageState();
}

class _NewInterventionPageState extends State<NewInterventionPage> {
  final _formKey = GlobalKey<FormState>();
  final _brand = TextEditingController();
  final _modelReference = TextEditingController();
  final _calibre = TextEditingController();
  final _movementNumber = TextEditingController();
  final _technician = TextEditingController(text: 'Técnico');
  final _initialState = TextEditingController();
  WatchType _watchType = WatchType.manual;
  String _orientation = 'crown_3';

  @override
  void dispose() {
    _brand.dispose();
    _modelReference.dispose();
    _calibre.dispose();
    _movementNumber.dispose();
    _technician.dispose();
    _initialState.dispose();
    super.dispose();
  }

  String? _required(String? value) {
    return value == null || value.trim().isEmpty
        ? 'Este campo es obligatorio'
        : null;
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.of(context).pop(
      InterventionDraft(
        brand: _brand.text,
        modelReference: _modelReference.text,
        calibre: _calibre.text,
        movementNumber: _movementNumber.text,
        watchType: _watchType,
        technician: _technician.text,
        referenceOrientation: _orientation,
        initialState: _initialState.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva intervención')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              TextFormField(
                key: const Key('brand-field'),
                controller: _brand,
                decoration: const InputDecoration(labelText: 'Marca *'),
                validator: _required,
                autofocus: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _modelReference,
                decoration: const InputDecoration(
                  labelText: 'Modelo o referencia',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _calibre,
                decoration: const InputDecoration(labelText: 'Calibre'),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _movementNumber,
                decoration: const InputDecoration(
                  labelText: 'Número de movimiento',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<WatchType>(
                initialValue: _watchType,
                decoration: const InputDecoration(labelText: 'Tipo'),
                items: WatchType.values
                    .map(
                      (type) => DropdownMenuItem(
                        value: type,
                        child: Text(type.label),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) _watchType = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                key: const Key('technician-field'),
                controller: _technician,
                decoration: const InputDecoration(labelText: 'Técnico *'),
                validator: _required,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _orientation,
                decoration: const InputDecoration(
                  labelText: 'Orientación de referencia',
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'crown_3',
                    child: Text('Corona a las 3'),
                  ),
                  DropdownMenuItem(
                    value: 'crown_12',
                    child: Text('Corona a las 12'),
                  ),
                  DropdownMenuItem(
                    value: 'dial_up',
                    child: Text('Esfera arriba'),
                  ),
                  DropdownMenuItem(
                    value: 'movement_up',
                    child: Text('Movimiento arriba'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) _orientation = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _initialState,
                decoration: const InputDecoration(
                  labelText: 'Estado inicial y observaciones',
                  alignLabelWithHint: true,
                ),
                minLines: 3,
                maxLines: 6,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                key: const Key('save-intervention'),
                onPressed: _save,
                icon: const Icon(Icons.save_outlined),
                label: const Text('Crear intervención y D01'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
