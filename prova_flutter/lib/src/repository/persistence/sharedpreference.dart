import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  List<String> anotations = [];

  Future<void> readAnotations() async {
    anotations.clear();
    final sharedPreferences = await SharedPreferences.getInstance();
    anotations = sharedPreferences.getStringList('anotations') ?? [];
    print(anotations);
  }

  Future<void> setAnotations(List<String> anotations) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList('anotations', anotations);
    // Atualiza a lista após a modificação
  }
}
