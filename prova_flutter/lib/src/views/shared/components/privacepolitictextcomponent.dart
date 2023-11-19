import 'package:flutter/material.dart';

class PrivacePoliticButtonComponent extends StatelessWidget {
  const PrivacePoliticButtonComponent({
    super.key,
    required this.redirect,
  });

  final void Function()? redirect;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      TextButton(
        onPressed: redirect,
        child: Text(
          "Políticas de Privacidade",
          style: Theme.of(context).textTheme.labelMedium,
        ),
      )
    ]);
  }
}
