import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/global/widgets/shimmer_loading/shimmer_loading.dart';
import 'package:pscomidas/app/modules/client_address/widgets/address_list_tile.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_submit.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_text_field.dart';

import '../client_address_store.dart';

class PickAddress extends StatefulWidget {
  const PickAddress({Key? key}) : super(key: key);
  @override
  _PickAddressState createState() => _PickAddressState();
}

class _PickAddressState extends State<PickAddress> {
  final ClientAddressStore store = Modular.get();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    store.isEditing = false;
    store.disposePick();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => store.jump(1),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: secondaryColor,
                  ),
                ),
                //const SizedBox(width: 50.0),
                const Expanded(
                  child: Text(
                    'Busque o endereço pelo CEP',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 75,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: CustomTextField(
                      controller: store.cepController,
                      hint: '00000-000',
                      phone: true,
                      formaters: [
                        MaskTextInputFormatter(
                          mask: '#####-###',
                          filter: {"#": RegExp(r'[0-9]')},
                        ),
                      ],
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 8) {
                          return 'CEP Inválido';
                        }
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await store.findCEP();
                      }
                    },
                    padding: const EdgeInsets.all(8.0),
                    hoverColor: Colors.transparent,
                    iconSize: 25,
                    splashRadius: 20,
                    highlightColor: Colors.transparent,
                    icon: const Icon(
                      Icons.search_sharp,
                      color: secondaryColor,
                    ),
                  )
                ],
              ),
            ),
            Observer(builder: (_) {
              if (store.tempAddress.body == null) {
                return const WarningListTile(icon: Icons.info_outlined);
              }

              if (store.tempAddress.isLoading) {
                return const ShimmerLoading(
                  child: AddressListTile(),
                );
              }

              if (store.tempAddress.hasError) {
                return WarningListTile(
                  errorMessage: store.tempAddress.message,
                  onTap: () => store.jump(1),
                  icon: Icons.error_outline_rounded,
                );
              }

              return AddressListTile(address: store.tempAddress.body);
            }),
            Observer(builder: (_) {
              return CustomSubmit(
                locked: !store.tempAddress.isCompleted,
                label: 'Salvar Endereço',
                onPressed: () async => store.createOrUpdate(),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class WarningListTile extends StatelessWidget {
  const WarningListTile({
    Key? key,
    this.errorMessage,
    this.hasError = false,
    this.icon = Icons.location_on_outlined,
    this.onTap,
  }) : super(key: key);

  final String? errorMessage;
  final bool hasError;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: hasError ? secondaryColor : Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: hasError ? Colors.white : tertiaryColor,
        ),
        title: const Text('Seu endereço endereço aparece por aqui'),
        subtitle: Text(errorMessage ?? ''),
        onTap: onTap,
      ),
    );
  }
}
