import 'dart:async';

import 'package:flutter/foundation.dart';

import '../domain/intervention.dart';
import '../domain/intervention_repository.dart';
import 'create_intervention.dart';

class InterventionsController extends ChangeNotifier {
  InterventionsController({
    required InterventionRepository repository,
    required CreateIntervention createIntervention,
  }) : _repository = repository,
       _createIntervention = createIntervention {
    _subscription = _repository.watchAll().listen(
      (items) {
        _items = items;
        _isLoading = false;
        notifyListeners();
      },
      onError: (Object _) {
        _isLoading = false;
        _errorMessage = 'No se pudieron cargar las intervenciones.';
        notifyListeners();
      },
    );
  }

  final InterventionRepository _repository;
  final CreateIntervention _createIntervention;
  late final StreamSubscription<List<Intervention>> _subscription;

  List<Intervention> _items = const [];
  bool _isLoading = true;
  bool _isSaving = false;
  String? _errorMessage;

  List<Intervention> get items => _items;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  String? get errorMessage => _errorMessage;

  Future<CreateInterventionResult?> create({
    required InterventionDraft draft,
    required Uri interventionsRoot,
  }) async {
    _isSaving = true;
    _errorMessage = null;
    notifyListeners();

    try {
      return await _createIntervention(
        draft: draft,
        interventionsRoot: interventionsRoot,
      );
    } on InterventionValidationException catch (error) {
      _errorMessage = error.message;
      return null;
    } catch (_) {
      _errorMessage = 'No se pudo crear la intervención.';
      return null;
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
