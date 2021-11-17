import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.title,
    this.validator,
    this.hint,
    required this.controller,
    this.formaters,
    this.isPassword,
    this.phone,
  }) : super(key: key);

  final String? title;
  final String? hint;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final List<TextInputFormatter>? formaters;
  final bool? isPassword;
  final bool? phone;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextStyle get titleStyle => GoogleFonts.getFont('Nunito',
      fontSize: 16.0, fontWeight: FontWeight.bold);

  TextStyle get digitedText => GoogleFonts.getFont('Nunito', fontSize: 16.0);

  bool obscure = false;

  @override
  void initState() {
    if (widget.isPassword != null && widget.isPassword!) {
      obscure = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null) ...[
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title!,
                  style: titleStyle,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
        ],
        TextFormField(
          style: digitedText,
          inputFormatters: widget.formaters,
          obscureText: obscure,
          textAlign: widget.phone == true ? TextAlign.center : TextAlign.start,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            hintText: widget.hint ?? '',
            suffixIcon: widget.isPassword != null && widget.isPassword == true
                ? MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: Icon(
                        obscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.black54,
                        size: 20,
                      ),
                      onTap: () => setState(() {
                        obscure = !obscure;
                      }),
                    ),
                  )
                : null,
          ),
          cursorColor: Colors.red,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          validator: widget.validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'O campo é obrigatório';
                }
              },
        ),
      ],
    );
  }
}
