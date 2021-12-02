import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

Widget textFormCard({hintText, validation, controller}) {
  return Observer(builder: (_) {
    return TextFormField(
      validator: validation,
      decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: secondaryColor)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: secondaryColor),
              borderRadius: BorderRadius.circular(5))),
      cursorColor: secondaryColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
    );
  });
}
