import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class CupomField extends StatelessWidget {
  final double auxWidth;

  const CupomField({
    Key? key,
    required this.auxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          const Divider(
            height: 12,
            color: Colors.black12,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            width: auxWidth * 0.8,
            child: TextFormField(
              cursorColor: secondaryColor,
              enabled: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Nunito',
              ),
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                icon: Icon(
                  Icons.local_offer_outlined,
                  color: secondaryColor,
                ),
                hintText: 'Cupom de desconto',
                hintStyle: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          const Divider(
            height: 12,
            color: Colors.black12,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
