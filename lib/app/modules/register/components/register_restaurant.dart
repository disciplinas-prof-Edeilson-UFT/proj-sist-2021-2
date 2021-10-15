import 'package:flutter/material.dart';

class RegisterRestaurant extends StatefulWidget {
  const RegisterRestaurant({Key? key}) : super(key: key);

  @override
  _RegisterRestaurantState createState() => _RegisterRestaurantState();
}

class _RegisterRestaurantState extends State<RegisterRestaurant> {
  /*var hintText = [
    'CPF',
    'Razão Social',
    'Nome da loja',
    'Telefone da fone',
    'CEP',
    'Cidade',
    'Estado',
    'Bairro',
    'Endereço',
    'Número',
    'Complemento (Opcional)',
    'Especialidade da loja',
  ];*/
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'CNPJ',
            labelText: 'CNPJ',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Razão Social',
            labelText: 'Razão social do seu negócio',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Nome da loja',
            labelText: 'Nome da loja',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Telefone da loja',
            labelText: 'Telefone da loja com DDD',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'CEP',
            labelText: 'CEP do seu negócio',
          ),
        ),
        Row(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Cidade',
                labelText: 'Cidade do seu negócio',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Estado',
                labelText: 'UF',
              ),
            ),
          ],
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Bairro',
            labelText: 'Bairro do seu negócio',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Endereço',
            labelText: 'Logradouro do seu negócio',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Número',
            labelText: 'Número do endereço',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Complemento (Opcional)',
            labelText: 'Complemento de endereço',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Especialidade da loja',
            labelText: 'Qual é a especialidade da sua loja?',
          ),
        ),
      ],
    );
  }
}
