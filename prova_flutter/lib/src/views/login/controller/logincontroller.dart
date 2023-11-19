import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:prova_flutter/src/repository/http/adapterhttp.dart';
import 'package:prova_flutter/src/shared/routes/routes.dart';
import 'package:prova_flutter/src/shared/validation/validation.dart';

import '../../../model/user.dart';
part 'logincontroller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store, Validation {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @observable
  bool isNotVisible = true;

  @action
  void changeVisible() {
    isNotVisible = !isNotVisible;
  }

  void validateForm(
      BuildContext context, AdapterHttp validationAPI, User user) {
    if (formKey.currentState!.validate()) {
      validateApi(validationAPI, user);
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

  void validateApi(AdapterHttp validationAPI, User user) {
    validationAPI.postValidation(user.toMap());
  }
}
