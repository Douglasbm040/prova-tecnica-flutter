import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../custom/customtheme.dart';
import '../../shared/components/privacepolitictextcomponent.dart';
import '../components/textformfieldcomponent.dart';
import '../controller/logincontroller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = LoginController();

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
            key: loginController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                TextFormFieldComponent(
                  label: "Usuário",
                  width: width,
                  icon: const Icon(Icons.person),
                  validator: loginController.userValidation,
                ),
                const SizedBox(height: 20),
                Observer(builder: (context) {
                  return TextFormFieldComponent(
                      label: "Senha",
                      width: width,
                      icon: const Icon(Icons.lock),
                      passwordField: true,
                      isObscure: loginController.isNotVisible,
                      validator: loginController.passwordValidation,
                      changedVisibility: loginController.changeVisible);
                }),
                Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SizedBox(
                        width: 250,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: () =>
                                loginController.validateForm(context),
                            child: Text(
                              "Entrar",
                              style: Theme.of(context).textTheme.labelMedium,
                            )))),
                Expanded(
                  flex: 2,
                  child: PrivacePoliticTextComponent(
                    redirect: () async {
                      await loginController
                          .redirectWeb("https://www.google.com");
                    },
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
