import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldComponent extends StatelessWidget {
  const TextFormFieldComponent({
    super.key,
    required this.width,
    required this.validator,
    required this.label,
    required this.icon,
    this.isObscure = false,
    this.passwordField = false,
    this.changedVisibility,
    required this.textFormFieldController,
  });

  final double width;
  final String? Function(String?) validator;
  final Function()? changedVisibility;
  final String label;
  final Icon icon;
  final bool isObscure;
  final bool passwordField;
  final TextEditingController textFormFieldController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width * 0.75,
          child: Row(
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
        Card(
          elevation: 3,
          child: SizedBox(
            width: width * 0.8,
            child: TextFormField(
              controller: textFormFieldController,
              obscureText: isObscure,
              textInputAction:
                  passwordField ? TextInputAction.done : TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: icon,
                suffixIcon: passwordField
                    ? isObscure
                        ? InkWell(
                            onTap: changedVisibility,
                            child: const Icon(Icons.visibility))
                        : InkWell(
                            onTap: changedVisibility,
                            child: const Icon(Icons.visibility_off))
                    : null,
                filled: true,
                fillColor: Theme.of(context).colorScheme.background,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              validator: (value) => validator(value),
              inputFormatters: [LengthLimitingTextInputFormatter(20)],
            ),
          ),
        ),
      ],
    );
  }
}
