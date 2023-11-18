import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:prova_flutter/src/repository/redirect/adapterredirect.dart';
part 'generalcontroller.g.dart';


class GeneralController = _GeneralControllerBase with _$GeneralController;

abstract class _GeneralControllerBase extends ChangeNotifier  with Store  {
  final AdapterRedirect redirect;
  _GeneralControllerBase({required this.redirect});
   
  void onTextPrivicyPolitic() {
    redirect.redirectWEB("https://www.google.com");
  }
}
