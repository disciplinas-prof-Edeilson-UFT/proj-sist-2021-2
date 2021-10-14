import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/product_options/product_store.dart';

class ProductDialog extends StatelessWidget {
  ProductDialog({
    Key? key,
    required this.product,
  }) : super(key: key);

  final RestaurantStore restaurantStore = Modular.get();
  final ProductOptionsStore store = Modular.get();
  final Product product;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return AlertDialog(
      titleTextStyle: const TextStyle(color: Colors.black54),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(flex: 6),
          Text(
            product.name.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const Spacer(flex: 2),
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
      content: SizedBox(
        width: screen.width * .5,
        height: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 300.0,
              width: screen.width * .2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    product.imgUrl ??
                        'https://firebasestorage.googleapis.com/v0/b/ps-comidas.appspot.com/o/no-image.png?alt=media&token=ef69bdba-5ece-4dc0-9754-fcf2a04364f0',
                  ),
                ),
              ),
            ),
            // const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(5.0),
              width: screen.width * .25,
              child: ListView(
                shrinkWrap: true,
                children: [
                  if (product.description != null) ...[
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        product.description.toString(),
                        textAlign: TextAlign.justify,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  if (product.price != null) ...[
                    Container(
                      color: Colors.white,
                      height: 20,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "R\$ " + FormatMoney.doubleToMoney(product.price!),
                        textAlign: TextAlign.justify,
                        style:
                            const TextStyle(color: Colors.green, fontSize: 14),
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  Container(
                    height: 115,
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.store),
                            Expanded(
                              child: Text(
                                " Burger King",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.yellow,
                            ),
                            Text(
                              "5.0",
                              style: TextStyle(color: Colors.yellow),
                            ),
                          ],
                        ),
                        Row(
                          children: List.generate(
                              300 ~/ 5,
                              (index) => Expanded(
                                    child: Container(
                                      color: index % 2 == 0
                                          ? Colors.transparent
                                          : Colors.grey,
                                      height: 2,
                                    ),
                                  )),
                        ),
                        Row(
                          children: const [
                            Text(
                              "36-46 min - R\$ 3,99",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
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
                  SizedBox(
                    height: 140,
                    child: TextField(
                      controller: store.observation,
                      textInputAction: TextInputAction.newline,
                      autofocus: true,
                      maxLength: 150,
                      maxLines: 4,
                      decoration: const InputDecoration(
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
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            QuantityButton(store: store),
            CheckoutButton(
              store: store,
              product: product,
              screen: screen,
            ),
            const SizedBox(width: 30),
          ],
        ),
      ],
    );
  }
}

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    Key? key,
    required this.store,
    required this.product,
    required this.screen,
  }) : super(key: key);

  final ProductOptionsStore store;
  final Product product;
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 55,
        width: screen.width * .1,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.black,
          ),
          onPressed: () => store.makeItem(product),
          child: Observer(builder: (_) {
            return Text(
              "Adicionar R\$ " +
                  FormatMoney.doubleToMoney(product.price! * store.quantity),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  const QuantityButton({
    Key? key,
    required this.store,
  }) : super(key: key);

  final ProductOptionsStore store;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Observer(
            builder: (_) => IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => store.decrement(),
              icon: Icon(
                Icons.remove,
                color: store.quantity > 1 ? Colors.red : Colors.black26,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.white,
            child: Center(
              child: Observer(
                builder: (_) => Text("${store.quantity}"),
              ),
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
    );
  }
}
