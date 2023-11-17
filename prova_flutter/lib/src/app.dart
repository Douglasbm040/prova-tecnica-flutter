import 'package:flutter/material.dart';
import 'package:prova_flutter/src/shared/routes/routes.dart';

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
      initialRoute: Routes.login,
      routes: {
        Routes.home: (context) =>
            const HomePage(title: 'Flutter Demo Home Page'),
        Routes.login: (context) => const LoginPage(),
      },
    );
  }
}
