import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
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
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        height: 220,
        width: 485,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/restaurant_home/dragAndDropArea.png'),
          ),
        ),
        child: Stack(
          children: [
            DropzoneView(
              onDrop: (e) {
                Navigator.pop(context);
              },
              onCreated: (controller) => this.controller = controller,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.insert_photo),
                  const Text('Arraste uma imagem aqui'),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Ou'),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(secondaryColor),
                    ),
                    onPressed: () async {
                      final event = await controller.pickFiles();
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                    label: const Text("Procurar Arquivo"),
                  ),
                  Text(
                    '.jpg ou .png',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
