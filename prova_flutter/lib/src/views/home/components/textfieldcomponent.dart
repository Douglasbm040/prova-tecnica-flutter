import 'package:flutter/material.dart';

import '../controller/homecontroler.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    super.key,
    required this.width,
    required this.homeController,
    required FocusNode focusNode,
  }) : _focusNode = focusNode;

  final double width;
  final HomeController homeController;
  final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.8,
      child: TextField(
        controller: homeController.textController,
        focusNode: _focusNode,
        decoration: InputDecoration(
          hintText: "Digite um texto",
          filled: true,
          fillColor: Theme.of(context).colorScheme.background,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        onSubmitted: homeController.editAnotationText,
      ),
    );
  }
}