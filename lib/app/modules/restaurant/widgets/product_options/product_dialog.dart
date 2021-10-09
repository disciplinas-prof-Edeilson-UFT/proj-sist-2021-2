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
      description:
          "Combo Prime! Acompanha: 10 Sashimis de salmão, 10 Camarões empanados, 36 Hots Philadelphia, 16 Enrolados de salmão cream cheese e cebolinha, 8 Enrolados salmão skin cream cheese e cebolinha, 4 Niguis de salmão com cream cheese e cebolinha, 4 Niguis skin loko, 10 Jyos de salmão cream cheese e 10 Salmão cubes (108 peças). Imagens meramente ilustrativas. Este combo adiciona 25 min no tempo de entrega.\n\nEscolha com consciência se deseja incluir ou não seu Kit delivery.\n\nItens adicionais colocados nas observações não acompanharão o pedido.",
      name: 'COMBO PRIME - 108 PEÇAS',
      price: 184.00,
    );

    return AlertDialog(
      titleTextStyle: const TextStyle(color: Colors.black54),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(flex:6),
           Text(
              product.name.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          const Spacer(flex:2),
          GestureDetector(
            onTap: () {
              Modular.to.pop();
              store.dispose();
            },
            child: const Align(
              child: Icon(Icons.close, color: Colors.grey),
            ),
          ),
        ],
      ),

      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 500.0,
            width: 500.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("logos/ifood-logo.png"),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: 700,
            child: ListView(
              shrinkWrap: true,
              children: [
                if (product.description != null) ...[
                  Container(
                    color: Colors.white,
                    width: 500,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      product.description.toString(),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                if (product.price != null) ...[
                  Container(
                    color: Colors.white,
                    height: 20,
                    width: 500,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "R\$ " + product.price.toString(),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.green, fontSize: 14),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 500,
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "Algum comentário?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6F6F67),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 500,
                  height: 140,
                  child: const TextField(
                    textInputAction: TextInputAction.newline,
                    autofocus: true,
                    maxLength: 150,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Ex: tirar cebola, maionese à parte, etc.",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
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
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
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
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
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
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {},
                  child: Observer(builder: (_) {
                    return Text(
                      "Adicionar R\$ " +
                          (product.price! * store.quantity).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
