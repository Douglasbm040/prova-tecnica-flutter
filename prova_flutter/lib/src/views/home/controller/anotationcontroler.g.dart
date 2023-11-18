// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anotationcontroler.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnotationController on _AnotationControllerBase, Store {
  late final _$anotationAtom =
      Atom(name: '_AnotationControllerBase.anotation', context: context);

  @override
  Anotation get anotation {
    _$anotationAtom.reportRead();
    return super.anotation;
  }

  @override
  set anotation(Anotation value) {
    _$anotationAtom.reportWrite(value, super.anotation, () {
      super.anotation = value;
    });
  }

  late final _$_AnotationControllerBaseActionController =
      ActionController(name: '_AnotationControllerBase', context: context);

  @override
  void anotationChangeIsExpanded() {
    final _$actionInfo = _$_AnotationControllerBaseActionController.startAction(
        name: '_AnotationControllerBase.anotationChangeIsExpanded');
    try {
      return super.anotationChangeIsExpanded();
    } finally {
      _$_AnotationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void anotationChangeText(String? input) {
    final _$actionInfo = _$_AnotationControllerBaseActionController.startAction(
        name: '_AnotationControllerBase.anotationChangeText');
    try {
      return super.anotationChangeText(input);
    } finally {
      _$_AnotationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
anotation: ${anotation}
    ''';
  }
}
