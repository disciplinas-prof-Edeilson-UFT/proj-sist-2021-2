import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

Widget addProduct() {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(10),
      hoverColor: Colors.transparent,
      child: const SizedBox(
        height: 200,
        width: 400,
        child: Icon(
          Icons.add_outlined,
          color: secondaryColor,
          size: 40,
        ),
      ),
      onTap: () {},
    ),
  );
}
