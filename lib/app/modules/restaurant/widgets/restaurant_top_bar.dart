import 'package:flutter/material.dart';

class RestaurantTopBar extends StatefulWidget {
  const RestaurantTopBar({
    Key? key,
  }) : super(key: key);

  @override
  _RestaurantTopBarState createState() => _RestaurantTopBarState();
}

class _RestaurantTopBarState extends State<RestaurantTopBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 2 * MediaQuery.of(context).size.width / 3,
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
          Row(
            children: [
              const CircleAvatar(
                maxRadius: 40,
                backgroundImage: NetworkImage(
                  "https://i.pinimg.com/736x/6f/1e/fb/6f1efb3e2f7ddb6f6b9a3dbefabe0c67.jpg",
                ),
              ),
              const SizedBox(width: 20),
              const Text(
                "Loja do nalbim",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),
              const SizedBox(width: 1),
              const Text(
                '5',
                style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
              Expanded(child: Container()),
              TextButton(
                onPressed: () => null,
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
        ],
      ),
    );
  }
}
