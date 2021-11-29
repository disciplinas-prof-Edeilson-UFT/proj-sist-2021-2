import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
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
                        const ProductImage(),
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
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        label: "Salvar",
                        onPressed: () async {
                          var price = store.formProduct['price']!.text
                              .split('R\$')
                              .toList();
                          double doublePrice = double.parse(price.elementAt(1));
                          var produto = Product(
                            name: store.formProduct['name']!.text.toString(),
                            description:
                                store.formProduct['desc']!.text.toString(),
                            price: doublePrice,
                            restaurantId: "dummy 2",
                            categories: store.formProduct['categories']!.text
                                .toString(),
                          );
                          await imageAlert("Produto Cadastrado", Colors.green)
                              .show(context);
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

  Flushbar imageAlert(String message, Color color) {
    return Flushbar(
      message: message,
      icon: const Icon(
        Icons.verified,
        color: Colors.white,
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(10.0),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(
        horizontal: 100.0,
        vertical: 10.0,
      ),
    );
  }
}
