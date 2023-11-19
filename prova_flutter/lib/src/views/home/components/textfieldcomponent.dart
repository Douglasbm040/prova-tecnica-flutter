import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controller/homecontroler.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    super.key,
    required this.width,
    required this.homeController,
    required this.focusNode,
  });

  final double width;
  final FocusNode focusNode;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.8,
      child: Observer(builder: (context) {
        return TextField(
          controller: homeController.textController,
          focusNode: homeController.focusNode,
          decoration: InputDecoration(
            hintText: "            Digite seu texto",
            filled: true,
            errorStyle: Theme.of(context).textTheme.labelSmall,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            errorText: homeController.errorText,
            fillColor: Theme.of(context).colorScheme.background,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          onSubmitted: homeController.editAnotationText,
          autofocus: true, //
          onEditingComplete: () => FocusScope.of(context).unfocus(),
        );
      }),
    );
  }
}
