import 'package:flutter/material.dart';

import 'custom/customtheme.dart';
import 'views/home/page/homepage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prova Tecnica Flutter',
      theme: CustomTheme.getTheme(),
      home: const HomePage(title: 'Prova Técnica Flutter'),
    );
  }
}
