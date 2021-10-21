import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/page_two/register_field.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/page_two/register_formulary.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/page_two/field_label_style.dart';
import 'package:search_cep/search_cep.dart';

class RegisterRestaurant extends StatefulWidget {
  const RegisterRestaurant({Key? key}) : super(key: key);

  @override
  _RegisterRestaurantState createState() => _RegisterRestaurantState();
}

class _RegisterRestaurantState extends State<RegisterRestaurant> {
  final homeStore = Modular.get<HomeStore>();
  final _formKey = GlobalKey<FormState>();
  final _fields = RegisterField.fields;
  final _categories = [
    'Açaí',
    'Lanches',
    'Padarias',
    'Pizza',
    'Saudável',
    'Bolos e Doces',
    'Bebidas',
    'Vegetariana',
    'Italiana',
    'Sorvetes',
    'Asiática',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: primaryCollor,
        automaticallyImplyLeading: false,
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Modular.to.navigate('page1');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: secondaryCollor,
            size: 30,
          ),
        ),
        title: const LogoAppBar(),
        centerTitle: true,
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
                    if (e == 'CEP') {
                      return RegisterFormulary(
                        label: e,
                        hintText: _fields[e]?['hintText'] as String,
                        controller:
                            _fields[e]?['controller'] as TextEditingController,
                        formatter:
                            _fields[e]?['formatter'] as TextInputFormatter,
                        valueChangeListener: (value) async {
                          //Esta função atribui os valores de endereço dinamicamente conforme o CEP informado.
                          final info = await ViaCepSearchCep().searchInfoByCep(
                              cep: value.replaceFirst('-', ''));
                          final cidade = _fields['Cidade']?['controller']
                              as TextEditingController;
                          final endereco = _fields['Endereço']?['controller']
                              as TextEditingController;
                          final estado = _fields['Estado']?['controller']
                              as TextEditingController;
                          final bairro = _fields['Bairro']?['controller']
                              as TextEditingController;
                          if (info.isRight()) {
                            endereco.text =
                                info.getOrElse(() => ViaCepInfo()).logradouro ??
                                    '';
                            cidade.text =
                                info.getOrElse(() => ViaCepInfo()).localidade ??
                                    '';
                            estado.text =
                                info.getOrElse(() => ViaCepInfo()).uf ?? '';
                            bairro.text =
                                info.getOrElse(() => ViaCepInfo()).bairro ?? '';
                          }
                        },
                      );
                    }
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
                              controller: _fields['Estado']?['controller']
                                  as TextEditingController,
                            ),
                          ),
                        ],
                      );
                    }
                    if (e == 'Estado') {
                      return Container();
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
                        Observer(
                          builder: (ctx) => DropdownButton<String>(
                            value: homeStore.selectedCategory,
                            style: fieldLabelStyle(),
                            icon: const Icon(Icons.expand_more),
                            iconEnabledColor: secondaryCollor,
                            onChanged: homeStore.setSelectedCategory,
                            elevation: 2,
                            underline: Container(
                              color: secondaryCollor,
                              height: 2.0,
                            ),
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
                  child: Observer(
                    builder: (ctx) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Qual plano você deseja contratar?',
                          style: fieldLabelStyle(),
                        ),
                        RadioListTile(
                          title: Text(
                            homeStore.availablePlans[0],
                            style: fieldLabelStyle(),
                          ),
                          value: homeStore.availablePlans[0],
                          groupValue: homeStore.selectedPlan,
                          activeColor: secondaryCollor,
                          onChanged: homeStore.setSelectedPlan,
                        ),
                        RadioListTile(
                          title: Text(
                            homeStore.availablePlans[1],
                            style: fieldLabelStyle(),
                          ),
                          value: homeStore.availablePlans[1],
                          groupValue: homeStore.selectedPlan,
                          activeColor: secondaryCollor,
                          onChanged: homeStore.setSelectedPlan,
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
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                'Cadastro realizado com sucesso!',
                              ),
                              titleTextStyle: fieldLabelStyle(),
                            ),
                          );
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
