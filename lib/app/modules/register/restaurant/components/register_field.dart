import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/field_label_style.dart';

class RegisterField extends StatelessWidget {
  const RegisterField({
    Key? key,
    required this.hintText,
    required this.label,
  }) : super(key: key);

  final String hintText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: fieldLabelStyle(),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(),
              focusColor: secondaryCollor,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryCollor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
