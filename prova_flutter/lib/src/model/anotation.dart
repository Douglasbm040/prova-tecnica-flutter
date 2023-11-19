// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
