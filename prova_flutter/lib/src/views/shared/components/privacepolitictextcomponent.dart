import 'package:flutter/material.dart';

class PrivacePoliticTextComponent extends StatelessWidget {
  const PrivacePoliticTextComponent({
    super.key,
    required this.redirect,
  });

  final void Function()? redirect;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: InkWell(
              onTap: redirect,
              child: Text(
                "Políticas de Privacidade",
                style: Theme.of(context).textTheme.labelMedium,
              )))
    ]);
  }
}
