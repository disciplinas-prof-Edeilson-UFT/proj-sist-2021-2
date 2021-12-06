import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  late DropzoneViewController controller;
  final restaurantHomeStore = Modular.get<RestaurantHomeStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 240,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/restaurant_home/dragAndDropArea.png'),
        ),
      ),
      child: Stack(
        children: [
          DropzoneView(
            onDrop: _dragUplodaImage,
            onCreated: (controller) => this.controller = controller,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.insert_photo),
                const Text('Arraste uma imagem aqui'),
                Text(
                  '.jpg ou .png',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _dragUplodaImage(dynamic event) async {
    final name = event.name;
    var end = name.split('.');
    if (end[1] == 'jpg' || end[1] == 'png') {
      restaurantHomeStore.setProductImage(event);
      await imageAlert("Imagem inserida", Colors.green).show(context);
    } else {
      await imageAlert("Arquivo não suportado", Colors.red).show(context);
    }
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
