import 'package:flutter/material.dart';
import 'package:prova_flutter/src/app.dart';
import 'package:prova_flutter/src/repository/http/httprepository.dart';
import 'package:prova_flutter/src/repository/persistence/sharedpreference.dart';
import 'package:prova_flutter/src/repository/redirect/redirect.dart';
import 'package:prova_flutter/src/views/shared/controller/generalcontroller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GeneralController>(
          create: (context) => GeneralController(redirect: Redirect()),
        ),
        ChangeNotifierProvider<SharedPreference>(
          create: (context) => SharedPreference(),
        ),
        ChangeNotifierProvider<HttpRepository>(
          create: (context) => HttpRepository(),
        ),
      ],child: const App(),),);
}
 