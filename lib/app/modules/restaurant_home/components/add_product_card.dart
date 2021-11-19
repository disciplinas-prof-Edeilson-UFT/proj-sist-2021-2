import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/add_product_components/custom_button.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/add_product_components/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final RestaurantHomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        hoverColor: Colors.transparent,
        child: const SizedBox(
          height: 200,
          width: 400,
          child: Icon(
            Icons.add_outlined,
            color: secondaryColor,
            size: 40,
          ),
        ),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Cadastrar novo produto"),
                  actions: <Widget>[
                    Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              ImagePicker()
                                  .pickImage(source: ImageSource.gallery)
                                  .then((value) => value!.readAsBytes().then(
                                          (value) =>
                                              null) //TODO Salvar na store
                                      );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: secondaryCollor),
                            child: const Text("img"),
                          ),
                          const CustomTextField(
                            label: 'Nome do produto',
                          ),
                          const CustomTextField(
                            label: 'Descrição do produto',
                          ),
                          const CustomTextField(
                            label: 'Preço do produto',
                          ),
                          const CustomTextField(
                            label: 'Categoria do produto',
                          ),
                          const CustomTextField(
                            label: 'Id do produto',
                          ),
                          SizedBox(
                            width: 250,
                            child: _availableButton(),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton(
                          label: "Salvar",
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    )
                  ],
                );
              });
        },
      ),
    );
  }

  Widget _buildSwitch() => Transform.scale(
        scale: 1.5,
        child: Observer(builder: (_) {
          return Switch.adaptive(
            value: store.available,
            activeColor: secondaryColor,
            inactiveThumbColor: secondaryColor.withOpacity(0.4),
            onChanged: (value) =>
                setState(() => store.available = !store.available),
          );
        }),
      );

  Widget _availableButton() {
    return Center(
      child: (Column(
        children: [
          const Text("Está disponivel?"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Não"),
              _buildSwitch(),
              const Text("Sim"),
            ],
          )
        ],
      )),
    );
  }
}
