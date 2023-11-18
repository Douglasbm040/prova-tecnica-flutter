class Anotation {
  String text;

  bool isNotExpansed;

  Anotation({required this.text, this.isNotExpansed = true});

  Anotation copyWith({String? text, bool? isExpansed}) {
    return Anotation(
      text: text ?? this.text,
      isNotExpansed: isExpansed ?? isNotExpansed,
    );
  }
}
