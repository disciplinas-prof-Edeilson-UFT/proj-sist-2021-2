import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/add_product_components/custom_button.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/add_product_components/custom_text_field.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/add_product_components/price_text_field.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/add_product_components/product_image.dart';
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
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const ProductImage();
                                });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: secondaryCollor),
                          child: const Text("img"),
                        ),
                        CustomTextField(
                          controller: store.formProduct['name'],
                          label: 'Nome do produto',
                        ),
                        CustomTextField(
                          controller: store.formProduct['desc'],
                          label: 'Descrição do produto',
                        ),
                        PriceTextField(
                          controller: store.formProduct['price'],
                          label: 'Preço do produto',
                        ),
                        CustomTextField(
                          controller: store.formProduct['categories'],
                          label: 'Categoria do produto',
                        ),
                        CustomTextField(
                          controller: store.formProduct['id'],
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
                          var price = store.formProduct['price']!.text
                              .split('R\$')
                              .toList();
                          double doublePrice = double.parse(price.elementAt(1));
                          var produto = Product(
                            name: store.formProduct['name']!.text.toString(),
                            description:
                                store.formProduct['desc']!.text.toString(),
                            available: store.available,
                            price: doublePrice,
                            restaurantId: "dummy 2",
                            productId: store.formProduct['id']!.text.toString(),
                            categories: [],
                          );
                          store.cadastrarProdutoTeste(produto);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )
                ],
              );
            },
          );
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
