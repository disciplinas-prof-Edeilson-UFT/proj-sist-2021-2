// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Widget TextFieldCard({labelText, onChanged, errorText}) {
  return Observer(builder: (_) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          labelText: labelText,
          errorText: errorText == null ? null : errorText(),
          border: OutlineInputBorder()),
    );
  });
}