import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class TextFieldCard extends StatefulWidget {
  const TextFieldCard({
    Key? key,
    required this.controller,
    required this.formaters,
    required this.hint,
    required this.validator,
  }) : super(key: key);

  final String? hint;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final List<TextInputFormatter>? formaters;

  @override
  _TextFieldCardState createState() => _TextFieldCardState();
}

class _TextFieldCardState extends State<TextFieldCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'O campo é obrigatório';
                }
              },
          controller: widget.controller,
          cursorColor: secondaryColor,
          enabled: true,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Nunito',
          ),
          inputFormatters: widget.formaters,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(5.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: secondaryColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: widget.hint,
            hintStyle: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
