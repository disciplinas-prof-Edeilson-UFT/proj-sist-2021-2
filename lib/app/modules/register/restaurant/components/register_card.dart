import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
 
class RegisterCard extends StatelessWidget {
  RegisterCard({ Key? key }) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Entre e ganhe 1 mês de mensalidade grátis!', 
                      style: TextStyle(fontSize: 16, ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Formulary(),
                ),
              ),
    
              const Text(
                'Ao prosseguir, aceito que o PSfood entre em contato comigo por telefone, email ou'
                ' Whatsapp (incluindo mensagens automáticas para fins comerciais).', 
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
    
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor: MaterialStateProperty.resolveWith(_getButtonColor),
                    minimumSize: MaterialStateProperty.all(const Size(210, 48)),
                  ),
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      //TODO: NAVIGATE TO NEXT PAGE.
                    } 
                  }, 
                  child: const Text('Começar o cadastro', style: TextStyle(fontFamily: 'Nunito', fontSize: 18),),
                ),
              ),
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


class Formulary extends StatelessWidget {
  Formulary({ Key? key }) : super(key: key);
  final TextStyle _labelStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Nunito',
  ); 
  final _phoneFormat = MaskTextInputFormatter(mask: '(##) #####-####', filter: { "#": RegExp(r'[0-9]') });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome completo', style: _labelStyle),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Este campo não pode ficar vazio";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'João da Silva',
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email', style: _labelStyle,),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Este campo não pode ficar vazio";
                }
                if (!value.contains('@') || !value.contains('.com')) {
                  return "Digite um email válido";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'email@email.com',
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Celular (com DDD)', style: _labelStyle,),
            TextFormField(
              inputFormatters: [_phoneFormat],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Este campo não pode ficar vazio";
                }
                if(value.length <= 14) {
                  return "Digite um número de telefone válido";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '(00) 00000-0000',
              ),
            ),
          ],
        ),
      ],
    );
  }
}