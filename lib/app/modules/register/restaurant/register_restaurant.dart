import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: primaryCollor,
        automaticallyImplyLeading: false,
        elevation: 2,
        title: const Center(
          child: LogoAppBar(),
        ),
      ),
      body: Container(
        width: size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Informações da loja',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Preencha abaixo as informações da sua futura loja no psfood com os dados do seu negócio',
                  style: TextStyle(
                    color: tertiaryCollor,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
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
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Cidade',
                        labelText: 'Cidade do seu negócio',
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Estado',
                        labelText: 'UF',
                      ),
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
          ),
        ),
      ),
    );
  }
}
