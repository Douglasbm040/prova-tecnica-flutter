import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:prova_flutter/src/model/anotation.dart';
import 'package:prova_flutter/src/repository/persistence/adapterpersistence.dart';
import 'package:prova_flutter/src/shared/validation/validation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/persistence/persistence.dart';
import '../../../repository/redirect/adapterredirect.dart';
import '../../../repository/redirect/redirect.dart';
import '../components/deleteconfirmationdialog.dart';
import 'package:mobx/mobx.dart';

import 'anotationcontroler.dart';
part 'homecontroler.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final TextEditingController textController;
  final AdapterPersistentence sharedPreferences;
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

  void editAnotationText(String input) {
    if (isEditionAnotation) {
      items[_index].anotationChangeText(input);
      isEditionAnotation = false;
      textController.text = "";
      updateListSharedPreference();
      return;
    }
    _addAnotation(input);
  }

  _HomeControllerBase(
      {required this.textController, required this.sharedPreferences}) {
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
