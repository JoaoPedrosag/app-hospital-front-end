// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_patients_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewPatientsController on _NewPatientsController, Store {
  late final _$age2Atom =
      Atom(name: '_NewPatientsController.age2', context: context);

  @override
  DateTime get age2 {
    _$age2Atom.reportRead();
    return super.age2;
  }

  @override
  set age2(DateTime value) {
    _$age2Atom.reportWrite(value, super.age2, () {
      super.age2 = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_NewPatientsController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_NewPatientsControllerActionController =
      ActionController(name: '_NewPatientsController', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_NewPatientsControllerActionController.startAction(
        name: '_NewPatientsController.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_NewPatientsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAge(DateTime value) {
    final _$actionInfo = _$_NewPatientsControllerActionController.startAction(
        name: '_NewPatientsController.setAge');
    try {
      return super.setAge(value);
    } finally {
      _$_NewPatientsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
age2: ${age2},
isLoading: ${isLoading}
    ''';
  }
}
