import 'package:flutter/material.dart';
import 'package:prova_flutter/src/custom/customtheme.dart';
import 'package:prova_flutter/src/repository/redirect/redirect.dart';
import 'package:prova_flutter/src/views/home/components/listanotationcomponent.dart';
import 'package:prova_flutter/src/views/home/controller/homecontroler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/src/views/shared/components/privacepolitictextcomponent.dart';

import '../../../repository/persistence/persistence.dart';
import '../../shared/controller/generalcontroller.dart';
import '../components/textfieldcomponent.dart';
import '../controller/anotationcontroler.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.controllerGeneral,
      required this.controllerPage});
  final GeneralController controllerGeneral;
  final HomeController controllerPage;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController(
      textController: TextEditingController(),
      sharedPreferences: SharedPreference());
  final genralController = GeneralController(redirect: Redirect());
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: CustomTheme.gradientColorBackground,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListAnotationComponent(
                  width: width, height: height, homeController: homeController),
              TextFieldComponent(
                  width: width,
                  homeController: homeController,
                  focusNode: _focusNode),
              PrivacePoliticTextComponent(
                redirect: genralController.onTextPrivicyPolitic,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
