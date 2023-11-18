import 'package:flutter/foundation.dart';
import 'package:prova_flutter/src/repository/persistence/adapterpersistence.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreference extends ChangeNotifier implements AdapterPersistentence {
 
  List<String> anotations = [];

  @override
  Future<void> readAnotations() async {
    anotations.clear();
    final sharedPreferences = await SharedPreferences.getInstance();
    anotations = sharedPreferences.getStringList('anotations') ?? [];
  }

  @override
  Future<void> setAnotations(List<String> anotations) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList('anotations', anotations);
    // Atualiza a lista após a modificação
  }
}
