import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CPF extends StatelessWidget {
  const CPF({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        inputFormatters: [
          // obrigatório
          FilteringTextInputFormatter.digitsOnly,
          CpfOuCnpjFormatter(),
        ],
        decoration: const InputDecoration(
          hoverColor: Colors.transparent,
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
          ),
          label: Text('CPF/CNPJ na nota'),
        ),
      ),
    );
  }
}
