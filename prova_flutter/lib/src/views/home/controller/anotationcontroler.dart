import 'package:mobx/mobx.dart';
import 'package:prova_flutter/src/model/anotation.dart';

part 'anotationcontroler.g.dart';

class AnotationController = _AnotationControllerBase with _$AnotationController;

abstract class _AnotationControllerBase with Store {
  @observable
  Anotation anotation;

  @action
  void anotationChangeIsExpanded() {
    if (anotation.text.length > 10) {
      anotation = anotation.copyWith(isExpansed: !anotation.isNotExpansed);
    }
  }

  @action
  void anotationChangeText(String? input) {
      anotation = anotation.copyWith(text: input ?? "");
    
  }

  _AnotationControllerBase({required this.anotation});
}
