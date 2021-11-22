import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pscomidas/app/modules/client_address/widgets/address_list_tile.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_submit_button.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => store.jump(1),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: secondaryCollor,
                ),
              ),
              const SizedBox(width: 50.0),
              const Text(
                'Pesquise pelo seu CEP',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
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
          Observer(builder: (_) {
            return Visibility(
              visible: store.tempAddress != null,
              child: AddressListTile(address: store.tempAddress),
            );
          }),
          CustomSubmit(
            label: 'Pesquisar',
            onPressed: () async => store.findCEP(),
          ),
        ],
      ),
    );
  }
}
