import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class CustomSubmit extends StatefulWidget {
  const CustomSubmit({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  final String label;
  final Function()? onPressed;
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
                onPrimary: Colors.red[400],
                animationDuration: const Duration(milliseconds: 500),
                primary: secondaryColor,
              ),
              onPressed: widget.onPressed,
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
