import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'register_formulary.dart';

class RegisterCard extends StatelessWidget {
  RegisterCard({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> controller = {
    'name': TextEditingController(),
    'email': TextEditingController(),
    'phone': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    CollectionReference restaurant =
        FirebaseFirestore.instance.collection('restaurant');

    Future<void> _addOwner() {
      return restaurant.add({
        'nameOwner': controller['name']?.text,
        'emailOwner': controller['email']?.text,
        'phoneOwner': controller['phone']?.text,
      });
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 8,
      child: Container(
        width: 420,
        height: 530,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontFamily: 'Nunito'),
                  children: [
                    TextSpan(
                      text: 'Cadastre sua loja\n',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Entre e ganhe 1 mês de mensalidade grátis!',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Formulary(
                    controller: controller,
                  ),
                ),
              ),
              const Text(
                'Ao prosseguir, aceito que o PSfood entre em contato comigo por telefone, email ou'
                ' Whatsapp (incluindo mensagens automáticas para fins comerciais).',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Observer(
                    builder: (_) {
                      return ElevatedButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor: MaterialStateProperty.resolveWith(
                              _getButtonColor),
                          minimumSize:
                              MaterialStateProperty.all(const Size(210, 48)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _addOwner();
                          }
                        },
                        child: const Text(
                          'Começar o cadastro',
                          style: TextStyle(fontFamily: 'Nunito', fontSize: 18),
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Color _getButtonColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
    };
    if (states.any(interactiveStates.contains)) {
      return const Color(0xffA31922);
    }
    return const Color(0xffEA1D2C);
  }
}
