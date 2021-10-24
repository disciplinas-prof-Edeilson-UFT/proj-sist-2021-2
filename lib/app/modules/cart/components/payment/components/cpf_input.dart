import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class CPF extends StatefulWidget {
  const CPF({Key? key}) : super(key: key);

  @override
  State<CPF> createState() => _CPFState();
}

class _CPFState extends State<CPF> {
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        inputFormatters: [
          // obrigatório
          FilteringTextInputFormatter.digitsOnly,
          CpfOuCnpjFormatter(),
        ],
        cursorColor: secondaryCollor,
        focusNode: myFocusNode,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryCollor),
          ),
          hoverColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(10),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
          ),
          label: const Text('CPF/CNPJ na nota'),
          labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? secondaryCollor : Colors.black,
          ),
        ),
      ),
    );
  }
}
