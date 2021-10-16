import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class RegisterRestaurant extends StatefulWidget {
  const RegisterRestaurant({Key? key}) : super(key: key);

  @override
  _RegisterRestaurantState createState() => _RegisterRestaurantState();
}

class _RegisterRestaurantState extends State<RegisterRestaurant> {
  final _fields = {
    'CPF': 'CPF',
    'Razão Social': 'Razão social do seu negócio',
    'Nome da loja': 'Nome da loja',
    'Telefone da fone': 'Telefone da loja com DDD',
    'CEP': 'CEP do seu negócio',
    'Cidade': 'Cidade do seu negócio',
    'Bairro': 'Bairro do seu negócio',
    'Endereço': 'Logradouro do seu negócio',
    'Número': 'Número do endereço',
    'Complemento (Opcional)': 'Complemento do endereço',
  };

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
              ..._fields.keys.map((e) {
                if (e == 'Cidade') {
                  return Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: e,
                            hintText: _fields[e],
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      Flexible(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Estado',
                            hintText: 'UF',
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return TextFormField(
                  decoration: InputDecoration(
                    labelText: e,
                    hintText: _fields[e],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
