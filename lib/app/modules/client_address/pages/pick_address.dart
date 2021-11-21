import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_text_field.dart';

import '../client_address_store.dart';

class PickAddress extends StatefulWidget {
  const PickAddress({Key? key}) : super(key: key);

  @override
  _PickAddressState createState() => _PickAddressState();
}

class _PickAddressState extends State<PickAddress> {
  final ClientAddressStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Trecho de ultilização do CustomTextField
            CustomTextField(
              controller: store.cepController,
              title: 'CEP',
              formaters: [
                MaskTextInputFormatter(
                  mask: '#####-###',
                  filter: {"#": RegExp(r'[0-9]')},
                ),
              ],
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 8) {
                  return 'CEP Inválido';
                }
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await store.findCEP();
              },
              child: const Text('pronto'),
            ),
          ],
        ),
      ),
    );
  }
}
