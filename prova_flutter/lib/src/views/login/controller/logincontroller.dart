import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:prova_flutter/src/shared/routes/routes.dart';
import 'package:prova_flutter/src/shared/validation/validation.dart';
part 'logincontroller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store, Validation {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  bool isNotVisible = true;

  @action
  void changeVisible() {
    isNotVisible = !isNotVisible;
  }

  void validateForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(Routes.home);
    }
  }

  String? passwordValidation(String? password) {
    return fieldValidator([
      () => hasTwoCharValidator(password),
      () => isAlphanumericValidator(password),
      () => isNotEmptyValidator(password),
      () => isNotEndsWithSpaceValidator(password)
    ]);
  }

  String? userValidation(String? password) {
    return fieldValidator([
      () => isNotEmptyValidator(password),
      () => isNotEndsWithSpaceValidator(password)
    ]);
  }
}
