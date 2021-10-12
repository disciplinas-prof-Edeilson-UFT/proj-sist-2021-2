import 'package:flutter/material.dart';

class CompanyHeader extends StatelessWidget {
  const CompanyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: double.infinity,
            child: const Text(
              'Seu pedido em',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: double.infinity,
            child: const Text(
              'PS Hambugers',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => {},
                child: const Text("Ver cardápio",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(),
            ],
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
