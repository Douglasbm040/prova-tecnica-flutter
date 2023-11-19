import 'package:flutter/material.dart';
import 'package:prova_flutter/src/custom/customtheme.dart';
import 'package:prova_flutter/src/views/home/components/listanotationcomponent.dart';
import 'package:prova_flutter/src/views/home/controller/homecontroler.dart';
import 'package:prova_flutter/src/views/shared/components/privacepolitictextcomponent.dart';

import '../../shared/controller/generalcontroller.dart';
import '../components/textfieldcomponent.dart';

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
  late HomeController homeController;
  late GeneralController genralController;

  @override
  void initState() {
    super.initState();
    homeController = widget.controllerPage;
    genralController = widget.controllerGeneral;
  }

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
              const Expanded(
                flex: 1,
                child: SizedBox(
                  height: 40,
                ),
              ),
              ListAnotationComponent(
                  width: width, height: height, homeController: homeController),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: TextFieldComponent(
                    width: width,
                    homeController: homeController,
                    focusNode: FocusNode()),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: PrivacePoliticButtonComponent(
                        redirect: genralController.onTextPrivicyPolitic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
