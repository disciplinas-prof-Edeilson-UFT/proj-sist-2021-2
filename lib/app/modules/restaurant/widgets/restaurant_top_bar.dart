import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';

class RestaurantTopBar extends StatefulWidget {
  const RestaurantTopBar({
    Key? key,
  }) : super(key: key);

  @override
  _RestaurantTopBarState createState() => _RestaurantTopBarState();
}

class _RestaurantTopBarState extends State<RestaurantTopBar> {
  final store = Modular.get<RestaurantStore>();

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SizedBox(
      width: 2 * screen.width / 3,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                  "https://png.pngtree.com/thumb_back/fh260/back_our/20190620/ourmid/pngtree-food-seasoning-food-banner-image_169169.jpg",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  backgroundImage: NetworkImage(store.restaurant!.image),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: screen.width * .3,
                  child: Text(
                    store.restaurant!.socialName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 20,
                ),
                const SizedBox(width: 1),
                Text(
                  store.restaurant!.avaliation != null
                      ? store.restaurant!.avaliation!.toStringAsFixed(1)
                      : '-',
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
                Expanded(child: Container()),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Ver mais",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  "|",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.monetization_on,
                  color: Colors.grey,
                  size: 20,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Pedido mínimo R\$ 9,99",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    onChanged: (value) => store.getProducts(value),
                    cursorColor: Colors.red,
                    decoration: const InputDecoration(
                      icon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.red,
                        ),
                      ),
                      hintText: 'Busque por item ou loja',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shadowColor: Colors.white,
                  enableFeedback: false,
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    children: const [
                      Icon(Icons.motorcycle, color: Colors.grey, size: 18),
                      SizedBox(width: 5),
                      Text(
                        'Entrega',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(Icons.keyboard_arrow_down_sharp, color: Colors.red),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Hoje',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text('24 - 34 min • R\$ 4,99',
                        style: TextStyle(color: Colors.grey))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
