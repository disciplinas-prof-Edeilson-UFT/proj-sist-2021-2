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
      description: "Cremoso sorvete sabor torta de limão com chip de biscoito e cobertura chocolate branco com raspas de limão!",
      name: 'EXTRUSADO TORTA DE LIMÃO',
      price: 10.0,
    );

    return AlertDialog(
      titleTextStyle: const TextStyle(color: Colors.black54),
      title: SizedBox(
        width: double.infinity,
        child: Container(
          alignment: const Alignment(0.55,0.00),
          color: Colors.white,
          child: Text(
            product.name.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13
            ),
          ),
        ),
      ),

      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 500.0,
            width: 500.0,
            decoration: const BoxDecoration(
               image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("logos/ifood-logo.png"),
               ),
            ),
          ),

         Container(
           padding: EdgeInsets.all(10),
           width: 400,
           child: ListView(
             children: [
               if (product.description!= null) ...[
                 Container(
                   color: Colors.white,
                   width: 500,
                   alignment: Alignment.bottomLeft,
                   child: Text(
                     product.description.toString(),
                     textAlign: TextAlign.justify,
                     style: const TextStyle(
                       color: Colors.grey,
                         fontSize: 14
                     ),
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
                   child: Text("R\$ "+
                     product.price.toString(),
                     textAlign: TextAlign.justify,
                     style: const TextStyle(
                       color: Colors.green,
                       fontSize: 14
                     ),
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
          GestureDetector(
            onTap: () {
              Modular.to.pop();
              store.dispose();
            },
            child: const Align(
              child: Icon(Icons.close, color: Colors.grey),
              alignment: Alignment.topRight,
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
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
                    return Row(
                      children: [
                        Text("Adicionar R\$ " + (product.price! * store.quantity).toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),),
                      ],
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
