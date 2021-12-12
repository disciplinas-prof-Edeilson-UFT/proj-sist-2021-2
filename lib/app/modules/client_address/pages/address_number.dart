// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_submit.dart';
import 'package:flutter/material.dart';
import '../client_address_store.dart';

class AddressNumber extends StatefulWidget {
  const AddressNumber({
    Key? key,
  }) : super(key: key);

  @override
  State<AddressNumber> createState() => _AddressNumberState();
}

class _AddressNumberState extends State<AddressNumber> {
  final ClientAddressStore store = Modular.get();

  get child => null;

  get mycontroller => null;

  @override
  void initState() {
    super.initState();
  }

  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => store.jump(2),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: secondaryColor,
              ),
            ),
            const Expanded(
              child: Text(
                'Você não informou o número de endereço',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 100,
          child: TextFormField(
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Número',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Endereço sem número'),
            Checkbox(
                value: checkValue,
                onChanged: (bool? value) {
                  setState(() {
                    checkValue = value!;
                  });
                }),
          ],
        ),
        CustomSubmit(
          label: 'Adcionar endereço',
          onPressed: () async => store.jump(3),
        ),
      ],
    );
  }
}
