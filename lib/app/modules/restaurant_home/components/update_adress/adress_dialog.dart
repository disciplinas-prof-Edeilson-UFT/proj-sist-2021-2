import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_adress/adress_form.dart';

class AdressDialog extends StatefulWidget {
  const AdressDialog({Key? key}) : super(key: key);

  @override
  _AdressDialogState createState() => _AdressDialogState();
}

class _AdressDialogState extends State<AdressDialog> {
  @override
  Widget build(BuildContext context) {
    double _pageWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 24),
      title: const Text('Endereço'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: _pageWidth * 0.4,
          child: Column(
            children: [
              AdressCep(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30.0, bottom: 30.0, left: 15.0, right: 15.0),
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      child: const Text(
                        'Confirmar cadastro',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(4),
                        minimumSize:
                            MaterialStateProperty.all(const Size(210, 48)),
                        backgroundColor:
                            MaterialStateProperty.all(secondaryColor),
                      ),
                      onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
