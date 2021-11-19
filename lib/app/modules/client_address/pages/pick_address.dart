import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_text_field.dart';

class PickAddress extends StatefulWidget {
  const PickAddress({Key? key}) : super(key: key);

  @override
  _PickAddressState createState() => _PickAddressState();
}

class _PickAddressState extends State<PickAddress> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Trecho de ultilização do CustomTextField
            CustomTextField(
              controller: controller,
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
          ],
        ),
      ),
    );
  }
}
