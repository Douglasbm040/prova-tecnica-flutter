// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homecontroler.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$isEditionAnotationAtom =
      Atom(name: '_HomeControllerBase.isEditionAnotation', context: context);

  @override
  bool get isEditionAnotation {
    _$isEditionAnotationAtom.reportRead();
    return super.isEditionAnotation;
  }

  @override
  set isEditionAnotation(bool value) {
    _$isEditionAnotationAtom.reportWrite(value, super.isEditionAnotation, () {
      super.isEditionAnotation = value;
    });
  }

  late final _$itemsAtom =
      Atom(name: '_HomeControllerBase.items', context: context);

  @override
  ObservableList<AnotationController> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<AnotationController> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$updateListAnotationsAsyncAction =
      AsyncAction('_HomeControllerBase.updateListAnotations', context: context);

  @override
  Future<void> updateListAnotations() {
    return _$updateListAnotationsAsyncAction
        .run(() => super.updateListAnotations());
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void _addAnotation(String? input) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase._addAnotation');
    try {
      return super._addAnotation(input);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteAnotation(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.deleteAnotation');
    try {
      return super.deleteAnotation(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchMethodeForEdit(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.switchMethodeForEdit');
    try {
      return super.switchMethodeForEdit(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEditionAnotation: ${isEditionAnotation},
items: ${items}
    ''';
  }
}
