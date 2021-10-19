import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/page_two/register_field.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/page_two/register_formulary.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/page_two/field_label_style.dart';

enum SingingCharacter { plan1, plan2 }

class RegisterRestaurant extends StatefulWidget {
  const RegisterRestaurant({Key? key}) : super(key: key);

  @override
  _RegisterRestaurantState createState() => _RegisterRestaurantState();
}

class _RegisterRestaurantState extends State<RegisterRestaurant> {
  final _formKey = GlobalKey<FormState>();
  final _fields = RegisterField.fields;
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
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Modular.to.navigate('page1');
              },
              icon: const Icon(
                Icons.arrow_back,
                color: secondaryCollor,
                size: 30,
              ),
            ),
            const LogoAppBar(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.33),
          width: size.width,
          color: Colors.white,
          child: Form(
            key: _formKey,
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
                            child: RegisterFormulary(
                              label: e,
                              hintText: _fields[e]?['hintText'] as String,
                              controller: _fields[e]?['controller']
                                  as TextEditingController,
                            ),
                          ),
                          const VerticalDivider(),
                          Flexible(
                            child: RegisterFormulary(
                              label: 'Estado',
                              hintText: 'UF',
                              controller: _fields[e]?['controller']
                                  as TextEditingController,
                            ),
                          ),
                        ],
                      );
                    }
                    return RegisterFormulary(
                      formatter: _fields[e]?['formatter'] as TextInputFormatter,
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
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 50.0,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: const Text(
                        'Confirmar cadastro',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(4),
                        minimumSize:
                            MaterialStateProperty.all(const Size(210, 48)),
                        backgroundColor:
                            MaterialStateProperty.all(secondaryCollor),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print ("oie");
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
