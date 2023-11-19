mixin Validation {
  String? fieldValidator(List<String? Function()> validators) {
    for (final function in validators) {
      final validation = function();
      if (validation != null) return validation;
    }
    return null;
  }

  String? isNotEmptyValidator(String? input, [String? message]) {
    if (input!.isEmpty) return message ?? "O campo deve ser preenchido";
    return null;
  }

  String? hasTwoCharValidator(String? input, [String? message]) {
    if (input!.length < 2) {
      return message ?? "O campo deve ter pelo menos dois caracteres";
    }
    return null;
  }

  String? isAlphanumericValidator(String? input, [String? message]) {
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(input!)) {
      return message ?? "O campo deve conter apenas letras e números";
    }
    return null;
  }

  String? isNotEndsWithSpaceValidator(String? input, [String? message]) {
    if (input!.endsWith(' ')) {
      return message ?? "O campo deve termina com espaço";
    }
    return null;
  }
}
