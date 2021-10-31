import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/restaurant_register/pages/page_two/register_cep.dart';
import 'package:pscomidas/app/modules/restaurant_register/pages/page_two/register_formulary.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_store.dart';

class RegisterRestaurant extends StatefulWidget {
  const RegisterRestaurant({
    Key? key,
  }) : super(key: key);
  @override
  _RegisterRestaurantState createState() => _RegisterRestaurantState();
}

class _RegisterRestaurantState extends State<RegisterRestaurant> {
  final RestaurantRegisterStore registerStore =
      Modular.get<RestaurantRegisterStore>();
  @override
  void initState() {
    if (registerStore.controller['nomeOwner'] == null) {
      Modular.to.navigate('page1');
    }
    super.initState();
  }

  @override
  void dispose() {
    registerStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    registerStore.controller['Categoria']?.text = 'Açaí';
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Modular.to.navigate('page1');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: secondaryColor,
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
            key: registerStore.formKey,
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
                      color: tertiaryColor,
                      fontSize: 16,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
                ...registerStore.fields.keys.map(
                  (e) {
                    if (e == 'CEP') {
                      return RegisterFormulary(
                        label: e,
                        hintText:
                            registerStore.fields[e]?['hintText'] as String,
                        controller: registerStore.controller[e],
                        formatter: registerStore.fields[e]?['formatter']
                            as TextInputFormatter,
                        valueChangeListener: (value) =>
                            RegisterCEP().searchAdress(value, registerStore),
                      );
                    }
                    if (e == 'Cidade') {
                      return Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: RegisterFormulary(
                              label: e,
                              hintText: registerStore.fields[e]?['hintText']
                                  as String,
                              controller: registerStore.controller[e],
                            ),
                          ),
                          const VerticalDivider(),
                          Flexible(
                            child: RegisterFormulary(
                              label: 'Estado',
                              hintText: 'UF',
                              controller: registerStore.controller['Estado'],
                            ),
                          ),
                        ],
                      );
                    }
                    if (e == 'Estado') {
                      return Container();
                    }
                    return RegisterFormulary(
                      formatter: registerStore.fields[e]?['formatter']
                          as TextInputFormatter,
                      label: e,
                      hintText: registerStore.fields[e]?['hintText'] as String,
                      controller: registerStore.controller[e],
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
                            value: registerStore.selectedCategory,
                            style: fieldLabelStyle(),
                            icon: const Icon(Icons.expand_more),
                            iconEnabledColor: secondaryColor,
                            onChanged: (String? newValue) {
                              registerStore.setSelectedCategory(newValue);
                            },
                            elevation: 2,
                            underline: Container(
                              color: secondaryColor,
                              height: 2.0,
                            ),
                            items: registerStore.categories.map((value) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qual plano você deseja contratar?',
                        style: fieldLabelStyle(),
                      ),
                      Observer(
                        builder: (_) => RadioListTile(
                          title: Text(
                            registerStore.availablePlans[0],
                            style: fieldLabelStyle(),
                          ),
                          value: registerStore.availablePlans[0],
                          groupValue: registerStore.selectedPlan,
                          activeColor: secondaryColor,
                          onChanged: registerStore.setSelectedPlan,
                        ),
                      ),
                      Observer(
                        builder: (_) => RadioListTile(
                          title: Text(
                            registerStore.availablePlans[1],
                            style: fieldLabelStyle(),
                          ),
                          value: registerStore.availablePlans[1],
                          groupValue: registerStore.selectedPlan,
                          activeColor: secondaryColor,
                          onChanged: registerStore.setSelectedPlan,
                        ),
                      ),
                    ],
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
                            MaterialStateProperty.all(secondaryColor),
                      ),
                      onPressed: () {
                        if (registerStore.formKey.currentState!.validate()) {
                          registerStore.addRestaurant();
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                'Cadastro realizado com sucesso!',
                              ),
                              titleTextStyle: fieldLabelStyle(),
                            ),
                          );
                          dispose();
                          Modular.to.navigate('/');
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
