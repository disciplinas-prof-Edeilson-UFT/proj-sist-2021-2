import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/product_options/product_store.dart';

class ProductDialog extends StatelessWidget {
  ProductDialog({Key? key}) : super(key: key);

  final RestaurantStore restaurantStore = Modular.get();
  final ProductOptionsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    // Size screen = MediaQuery.of(context).size;
    final Product product = Product(
      description: 'Coquinha Gelada!',
      name: 'COCA-COLA 600ML',
      price: 3.5,
    );

    return AlertDialog(
      title: Text(
        product.name.toString(),
        textAlign: TextAlign.center,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 500.0,
            width: 500.0,
            decoration: const BoxDecoration(
              color: Colors.red,
              // image: DecorationImage(
              //  fit: BoxFit.cover,
              //  image: AssetImage("logos/produto1.jpeg"),
              // ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (product.price != null) ...[
                Text(
                  product.price.toString(),
                )
              ],
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 500,
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Algum comentário?",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                width: 500,
                height: 150,
                child: const TextField(
                  textInputAction: TextInputAction.newline,
                  autofocus: true,
                  maxLength: 150,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Ex: tirar cebola, maionese à parte, etc.",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => store.decrement(),
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.white,
                          child: Center(
                            child: Observer(builder: (_) {
                              return Text("${store.quantity}");
                            }),
                          ),
                        ),
                        IconButton(
                          onPressed: () => store.increment(),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 55,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          onPrimary: Colors.black,
                        ),
                        onPressed: () {},
                        child: Observer(builder: (_) {
                          return Text(
                            "ADICIONAR R\$ " +
                                (product.price! * store.quantity).toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Modular.to.pop();
              store.dispose();
            },
            child: const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.close, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
