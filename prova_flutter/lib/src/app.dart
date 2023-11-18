import 'package:flutter/material.dart';
import 'package:prova_flutter/src/repository/persistence/persistence.dart';
import 'package:prova_flutter/src/shared/routes/routes.dart';
import 'package:prova_flutter/src/views/home/controller/homecontroler.dart';
import 'package:prova_flutter/src/views/login/controller/logincontroller.dart';
import 'package:prova_flutter/src/views/shared/controller/generalcontroller.dart';
import 'package:provider/provider.dart';

import 'custom/customtheme.dart';
import 'views/home/page/homepage.dart';
import 'views/login/page/loginpage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prova Tecnica Flutter',
      theme: CustomTheme.getTheme(),
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) =>
            Consumer2<GeneralController, SharedPreference>(
                builder: (context, generalController, sharedPreferences, _) {
              return HomePage(
                controllerGeneral: generalController,
                controllerPage: HomeController(
                    sharedPreferences: sharedPreferences,
                    textController: TextEditingController()),
              );
            }),
        Routes.login: (context) => Consumer<GeneralController>(
                builder: (context, generalController, _) {
              return LoginPage(
                controllerGeneral: generalController,
                controllerPage: LoginController(),
              );
            }),
      },
    );
  }
}
