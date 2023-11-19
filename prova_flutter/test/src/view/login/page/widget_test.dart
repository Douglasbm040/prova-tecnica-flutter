import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prova_flutter/src/repository/http/httprepository.dart';
import 'package:prova_flutter/src/repository/redirect/redirect.dart';
import 'package:prova_flutter/src/views/login/page/loginpage.dart';
import 'package:prova_flutter/src/views/login/controller/logincontroller.dart';
import 'package:prova_flutter/src/views/shared/controller/generalcontroller.dart';

void main() {
  testWidgets("Test label fixas ", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(
          controllerGeneral: GeneralController(redirect: Redirect()),
          controllerPage: LoginController(),
          http: HttpRepository(),
        ),
      ),
    );
    expect(find.text("Senha"), findsWidgets);
    expect(find.text("Usuário"), findsWidgets);
    expect(find.text("Entrar"), findsWidgets);
  });
  testWidgets('test TextFormFied validacao ', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(
          controllerGeneral: GeneralController(redirect: Redirect()),
          controllerPage: LoginController(),
          http: HttpRepository(),
        ),
      ),
    );

    final usuarioTextField = find.byKey(const Key('UsuarioTextFieldKey'));
    

    await tester.enterText(usuarioTextField, 'u');
   
    final loginButton = find.text('Entrar');

    await tester.tap(loginButton);
    await tester.pump();
    expect(find.text("O campo deve ter pelo menos dois caracteres"),
        findsOneWidget);
   
  });
}
