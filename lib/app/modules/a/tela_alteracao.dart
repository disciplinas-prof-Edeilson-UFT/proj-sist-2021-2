import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pscomidas/app/modules/register_client/register_client_store.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_submit_button.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_text_field.dart';

class TelaAlteracao extends StatefulWidget {
  const TelaAlteracao({ Key? key }) : super(key: key);

  @override
  _TelaAlteracaoState createState() => _TelaAlteracaoState();
}

class _TelaAlteracaoState extends State<TelaAlteracao> {

  //final RegisterClientStore store = Modular.get();
  TextEditingController nameController = TextEditingController(); 
  TextEditingController cpfController = TextEditingController(); 
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController checkPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextStyle get fontFamily => GoogleFonts.getFont('Sen', fontSize: 16.0);

  TextStyle get digitedText => GoogleFonts.getFont('Sen', fontSize: 14.0);

  final _formKey = GlobalKey<FormState>();
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: screen.width > 1069
            ? screen.width * .35
            : screen.width > 750
                ? screen.width * .5
                : screen.width,
        padding: const EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              spreadRadius: 2,
            )
          ],
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Editar dados',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(  
                    border: OutlineInputBorder(),   
                    labelText: 'Nome Completo',
                    hintText: 'Insira seu nome completo',
                  ),   
                   //controller: nameController,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: cpfController,
                  title: 'CPF',
                  hint: 'CPF (Opicional)',
                  validator: (value) {
                    if (!CPFValidator.isValid(value)) {
                      return 'CPF inválido';
                    }
                  },
                  formaters: [
                    MaskTextInputFormatter(
                      mask: '###.###.###-##',
                      filter: {"#": RegExp(r'[0-9]')},
                    )
                  ],
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: phoneController,
                  title: 'Telefone com (DDD)',
                  hint: 'Insira seu telefone',
                  formaters: [
                    MaskTextInputFormatter(
                      mask: '+## (##) #####-####',
                      filter: {"#": RegExp(r'[0-9]')},
                    )
                  ],
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: emailController,
                  title: 'E-mail',
                  hint: 'Insira seu email',
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'E-mail Inválido'
                          : null,
                ),
                const SizedBox(height: 20),
                CustomSubmit(
                  label: 'Confirmar',
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        checked != false) {
                      //store.goToConfirmPhone();
                    }
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}