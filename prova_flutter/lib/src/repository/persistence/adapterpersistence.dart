abstract class AdapterPersistentence {
  List<String> anotations = [];
  Future<void> readAnotations();
  Future<void> setAnotations(List<String> anotations);
}
