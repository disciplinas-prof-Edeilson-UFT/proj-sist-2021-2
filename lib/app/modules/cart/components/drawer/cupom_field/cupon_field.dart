import 'package:flutter/material.dart';

class CupomField extends StatefulWidget {
  const CupomField({Key? key}) : super(key: key);

  @override
  _CupomFieldState createState() => _CupomFieldState();
}

class _CupomFieldState extends State<CupomField> {
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
            width: MediaQuery.of(context).size.width * 0.2,
            child: TextFormField(
              enabled: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                icon: Icon(Icons.local_offer_outlined),
                hintText: 'Insira seu cupom de desconto',
                hintStyle: TextStyle(
                  fontSize: 18,
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
