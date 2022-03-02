import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hintText;

  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      required this.textInputType,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        hintText: hintText,
        filled: true,
        fillColor: Color(0xff97d2ed).withOpacity(0.6),
        contentPadding: EdgeInsets.all(8),
        hintStyle: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.normal,
          fontSize: 14,
          letterSpacing: 2,
        ),
      ),
      keyboardType: textInputType,
    );
  }
}
