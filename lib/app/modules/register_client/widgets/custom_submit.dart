import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class CustomSubmit extends StatefulWidget {
  const CustomSubmit({
    Key? key,
    required this.label,
    required this.onPressed,
    this.locked = false,
  }) : super(key: key);

  final String label;
  final Function()? onPressed;
  final bool locked;

  @override
  _CustomSubmitState createState() => _CustomSubmitState();
}

class _CustomSubmitState extends State<CustomSubmit> {
  TextStyle get digitedText =>
      GoogleFonts.getFont('Nunito', fontSize: 22.0, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(50),
                onPrimary: widget.locked ? tertiaryColor : secondaryColor,
                animationDuration: const Duration(milliseconds: 500),
                primary: widget.locked ? tertiaryColor : secondaryColor,
              ),
              onPressed: widget.locked ? null : widget.onPressed,
              child: Text(
                widget.label,
                style: digitedText,
              ),
            ),
          )
        ],
      ),
    );
  }
}
