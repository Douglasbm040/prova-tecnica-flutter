import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:prova_flutter/src/model/anotation.dart';
import 'package:prova_flutter/src/shared/validation/validation.dart';

import '../../../repository/persistence/sharedpreference.dart';

import '../components/deleteconfirmationdialog.dart';
import 'anotationcontroler.dart';
part 'homecontroler.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store, Validation {
  final TextEditingController textController = TextEditingController();
  final SharedPreference sharedPreferences;
  final FocusNode focusNode = FocusNode();

  @observable
  String? errorText;

  int _index = 0;

  set index(int value) {
    _index = value;
  }

  @observable
  bool isEditionAnotation = false;
  
  @observable
  ObservableList<AnotationController> items =
      ObservableList<AnotationController>();

  @action
  void _addAnotation(String? input) {
    items.add(AnotationController(anotation: Anotation(text: input ?? "")));
    textController.text = "";
    updateListSharedPreference();
  }

  @action
  void deleteAnotation(int index) {
    items.removeAt(index);
    isEditionAnotation = false;
    textController.text = "";
    updateListSharedPreference();
  }

  @action
  void switchMethodeForEdit(int index) {
    isEditionAnotation = true;
    _index = index;
    textController.text = items[index].anotation.text;
  }

  @action
  void editAnotationText(String input) {
    errorText = isNotEmptyValidator(input);
    if (errorText == null) {
      if (isEditionAnotation) {
        items[_index].anotationChangeText(input);
        isEditionAnotation = false;
        textController.text = "";
        updateListSharedPreference();
        focusNode.requestFocus();
        return;
      }
      _addAnotation(input);
    }
    focusNode.requestFocus();
  }

  _HomeControllerBase(
      {required this.sharedPreferences}) {
    initListAnotations();
  }
  @action
  Future<void> updateListAnotations() async {
    await sharedPreferences.readAnotations();
    items = sharedPreferences.anotations
        .map((text) => AnotationController(anotation: Anotation(text: text)))
        .toList()
        .asObservable();
  }

  initListAnotations() {
    updateListAnotations();
  }

  void updateListSharedPreference() async {
    await sharedPreferences
        .setAnotations(items.map((e) => e.anotation.text).toList());
    updateListAnotations();
  }

  void showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteConfirmationDialog(
          onConfirm: () => deleteAnotation(index),
        );
      },
    );
  }
}
