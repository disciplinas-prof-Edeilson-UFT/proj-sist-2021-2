import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class StatusOrder extends StatelessWidget {
  const StatusOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        width: screen.width,
        height: screen.height,
        color: primaryCollor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: tertiaryCollor,
                ))
          ],
        ),
      ),
    );
  }
}
