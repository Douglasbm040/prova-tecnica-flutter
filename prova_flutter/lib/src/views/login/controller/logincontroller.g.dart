// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logincontroller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  late final _$isvisibleAtom =
      Atom(name: '_LoginControllerBase.isvisible', context: context);

  @override
  bool get isvisible {
    _$isvisibleAtom.reportRead();
    return super.isvisible;
  }

  @override
  set isvisible(bool value) {
    _$isvisibleAtom.reportWrite(value, super.isvisible, () {
      super.isvisible = value;
    });
  }

  late final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase', context: context);

  @override
  void changeVisible() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.changeVisible');
    try {
      return super.changeVisible();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isvisible: ${isvisible}
    ''';
  }
}
