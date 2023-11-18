import 'package:flutter_test/flutter_test.dart';

import 'package:prova_flutter/src/views/login/controller/logincontroller.dart';

void main() {
  final login = LoginController();

  group("Teste de validação ", () {
    test("Teste de validação de campos - valores corretos", () {
      expect(login.hasTwoCharValidator("tes"), isNull);
      expect(login.isAlphanumericValidator("hasgf1212"), isNull);
      expect(login.isNotEmptyValidator("ASD"), isNull);
      expect(
          login.isNotEndsWithSpaceValidator(
            "tes",
          ),
          isNull);
    });

    test("Teste de validação de campos - valores incorretos", () {
      expect(login.hasTwoCharValidator("t", "deve ter pelo menos 2 caracteres"),
          equals("deve ter pelo menos 2 caracteres"));
      expect(login.isAlphanumericValidator("@!@#", "alfanumerico"),
          equals("alfanumerico"));
      expect(login.isNotEmptyValidator("", "O campo deve ser preenchido"),
          equals("O campo deve ser preenchido"));
      expect(
          login.isNotEndsWithSpaceValidator(
              "tes ", "nao pode terminar com espaco"),
          equals("nao pode terminar com espaco"));
    });
  });

  group("teste de controler de estado [isNotVisible]", () {
    final stateLogin = LoginController();
    test("verificando valor inicial de [isNotVisible]", () {
      expect(
        stateLogin.isNotVisible, true
      );
    });
    login.changeVisible();
    test("varificando valor alterado de [isNotVisible]", () {
      expect(login.isNotVisible, false);
    });
    
  });
}
