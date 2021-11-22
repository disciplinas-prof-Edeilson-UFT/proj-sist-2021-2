import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pscomidas/app/global/repositories/restaurant_home/profile/profile_repository.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/components_profile_dialog.dart';

class ManagementFormulary extends StatelessWidget {
  ManagementFormulary({Key? key}) : super(key: key);

  final RestaurantHomeStore homeStore = Modular.get<RestaurantHomeStore>();

  final TextStyle _labelStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Nunito',
  );
  final _phoneFormat = MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  final _padding =
      const EdgeInsets.only(top: 10.0, bottom: 5.0, left: 5.0, right: 5.0);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: homeStore.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: _padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome completo do responsável da loja',
                  style: _labelStyle,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller:
                            homeStore.managementFormController['name_Owner'],
                        textCapitalization: TextCapitalization.words,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Este campo não pode ficar vazio";
                          }
                          if (value.trim().split(' ').length < 2) {
                            return "Precisa conter pelo menos dois nomes";
                          }
                          return null;
                        },
                        cursorColor: secondaryColor,
                        decoration: const InputDecoration(
                          focusColor: secondaryColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: secondaryColor,
                            ),
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'João da Silva',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: _padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Celular do responsável da loja', style: _labelStyle),
                  TextFormField(
                    controller:
                        homeStore.managementFormController['phone_Owner'],
                    inputFormatters: [_phoneFormat],
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Este campo não pode ficar vazio";
                      }
                      if (value.length <= 14) {
                        return "Digite um número de telefone válido";
                      }
                      return null;
                    },
                    cursorColor: secondaryColor,
                    decoration: const InputDecoration(
                      focusColor: secondaryColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: secondaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      hintText: '(00) 00000-0000',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: _padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email de acesso',
                  style: _labelStyle,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller:
                            homeStore.managementFormController['email_Owner'],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Este campo não pode ficar vazio";
                          }
                          if (!EmailValidator.validate(value)) {
                            return "Digite um email válido";
                          }
                          return null;
                        },
                        readOnly: true,
                        cursorColor: secondaryColor,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          filled: true,
                          focusColor: secondaryColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'email@email.com',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: _padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Senha',
                  style: _labelStyle,
                ),
                TextFormField(
                  controller: homeStore.managementFormController['Senha'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ficar vazio";
                    }
                    if (value.length < 6) {
                      return "Senha muito curta.";
                    }
                    return homeStore.validatePassword();
                  },
                  obscureText: true,
                  cursorColor: secondaryColor,
                  decoration: const InputDecoration(
                    hintText: '******',
                    focusColor: secondaryColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: secondaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ],
            ),
          ),
          Padding(
            padding: _padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Confirmar Senha',
                  style: _labelStyle,
                ),
                TextFormField(
                  controller:
                      homeStore.managementFormController['Confirmar Senha'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ficar vazio";
                    }
                    if (value.length < 6) {
                      return "Senha muito curta.";
                    }
                    return homeStore.validatePassword();
                  },
                  obscureText: true,
                  cursorColor: secondaryColor,
                  decoration: const InputDecoration(
                    hintText: '******',
                    focusColor: secondaryColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: secondaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
            child: ConfirmationButton(
              onPressed: () async {
                if (homeStore.formKey.currentState!.validate()) {
                  await ProfileRepository()
                      .setManagementRestaurant(homeStore.restaurant!);
                  homeStore.getRestaurant();
                  Navigator.of(context).pop();
                  await showConfirmationFlush(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
