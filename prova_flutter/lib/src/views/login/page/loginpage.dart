import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/src/model/user.dart';
import 'package:prova_flutter/src/repository/http/adapterhttp.dart';
import 'package:prova_flutter/src/views/login/controller/logincontroller.dart';
import 'package:prova_flutter/src/views/shared/controller/generalcontroller.dart';

import '../../../custom/customtheme.dart';
import '../../shared/components/privacepolitictextcomponent.dart';
import '../components/textformfieldcomponent.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
      {super.key,
      required this.controllerGeneral,
      required this.controllerPage,
      required this.http});
  final GeneralController controllerGeneral;
  final LoginController controllerPage;
  final AdapterHttp http;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controllerPage;
  late GeneralController controllerGeneral;
  @override
  void initState() {
    super.initState();
    controllerGeneral = widget.controllerGeneral;
    controllerPage = widget.controllerPage;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: CustomTheme.gradientColorBackground,
            ),
          ),
          child: Form(
            key: controllerPage.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                TextFormFieldComponent(
                  key: const Key("SenhaTextFieldKey"),
                  label: "Usuário",
                  width: width,
                  icon: const Icon(Icons.person),
                  validator: controllerPage.userValidation,
                  textFormFieldController: controllerPage.userController,
                ),
                const SizedBox(height: 20),
                Observer(builder: (context) {
                  return TextFormFieldComponent(
                    key: const Key("UsuarioTextFieldKey"),
                    label: "Senha",
                    width: width,
                    icon: const Icon(Icons.lock),
                    passwordField: true,
                    isObscure: controllerPage.isNotVisible,
                    validator: controllerPage.passwordValidation,
                    changedVisibility: controllerPage.changeVisible,
                    textFormFieldController: controllerPage.passwordController,
                  );
                }),
                Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SizedBox(
                        width: 250,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: () => controllerPage.validateForm(
                                context,
                                widget.http,
                                User(
                                    user: controllerPage.userController.text,
                                    password: controllerPage
                                        .passwordController.text)),
                            child: Text(
                              "Entrar",
                              style: Theme.of(context).textTheme.labelMedium,
                            )))),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: PrivacePoliticButtonComponent(
                      redirect: controllerGeneral.onTextPrivicyPolitic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
