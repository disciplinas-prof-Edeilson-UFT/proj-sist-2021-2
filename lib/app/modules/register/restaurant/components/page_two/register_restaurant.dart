import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/page_two/register_field.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/page_two/field_label_style.dart';

enum SingingCharacter { plan1, plan2 }

class RegisterRestaurant extends StatefulWidget {
  const RegisterRestaurant({Key? key}) : super(key: key);

  @override
  _RegisterRestaurantState createState() => _RegisterRestaurantState();
}

class _RegisterRestaurantState extends State<RegisterRestaurant> {
  final _fields = {
    'CNPJ': {
      'hintText': 'CNPJ',
      'controller': TextEditingController(),
    },
    'Razão Social': {
      'hintText': 'Razão social do seu negócio',
      'controller': TextEditingController(),
    },
    'Nome da loja': {
      'hintText': 'Nome da loja',
      'controller': TextEditingController(),
    },
    'Telefone da loja': {
      'hintText': 'Telefone da loja com DDD',
      'controller': TextEditingController(),
    },
    'CEP': {
      'hintText': 'CEP do seu negócio',
      'controller': TextEditingController(),
    },
    'Cidade': {
      'hintText': 'Cidade do seu negócio',
      'controller': TextEditingController(),
    },
    'Bairro': {
      'hintText': 'Bairro do seu negócio',
      'controller': TextEditingController(),
    },
    'Endereço': {
      'hintText': 'Logradouro do seu negócio',
      'controller': TextEditingController(),
    },
    'Número': {
      'hintText': 'Número do endereço',
      'controller': TextEditingController(),
    },
    'Complemento (Opcional)': {
      'hintText': 'Complemento do endereço',
      'controller': TextEditingController(),
    },
    'Senha': {
      'hintText': 'Senha para acesso à página da loja',
      'controller': TextEditingController(),
    },
  };

  final _categories = [
    'Açaí',
    'Lanches',
    'Padarias',
    'Pizza',
    'Saldável',
    'Bolos e Doces',
    'Bebidas',
    'Vegetariana',
    'Italiana',
    'Sorvetes',
    'Asiática',
  ];

  SingingCharacter? _character = SingingCharacter.plan1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var selectedValue = 'Açaí';

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.33),
          width: size.width,
          color: Colors.white,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Informações da loja',
                  style: TextStyle(
                    fontSize: 24,
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
              ..._fields.keys.map(
                (e) {
                  if (e == 'Cidade') {
                    return Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: RegisterField(
                            label: e,
                            hintText: _fields[e]?['hintText'] as String,
                            controller: _fields[e]?['controller']
                                as TextEditingController,
                          ),
                        ),
                        const VerticalDivider(),
                        Flexible(
                          child: RegisterField(
                            label: 'Estado',
                            hintText: 'UF',
                            controller: _fields[e]?['controller']
                                as TextEditingController,
                          ),
                        ),
                      ],
                    );
                  }
                  return RegisterField(
                    label: e,
                    hintText: _fields[e]?['hintText'] as String,
                    controller:
                        _fields[e]?['controller'] as TextEditingController,
                  );
                },
              ).toList(),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Especialidade da loja',
                        style: fieldLabelStyle(),
                      ),
                      DropdownButton(
                        value: selectedValue,
                        style: fieldLabelStyle(),
                        icon: const Icon(Icons.expand_more),
                        iconEnabledColor: secondaryCollor,
                        elevation: 2,
                        underline: Container(
                          color: secondaryCollor,
                          height: 2.0,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: _categories.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 50.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qual plano você deseja contratar?',
                        style: fieldLabelStyle(),
                      ),
                      RadioListTile(
                        title: Text(
                          'Plano Básico',
                          style: fieldLabelStyle(),
                        ),
                        value: SingingCharacter.plan1,
                        groupValue: _character,
                        activeColor: secondaryCollor,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(
                          'Plano Entrega',
                          style: fieldLabelStyle(),
                        ),
                        value: SingingCharacter.plan2,
                        groupValue: _character,
                        activeColor: secondaryCollor,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
