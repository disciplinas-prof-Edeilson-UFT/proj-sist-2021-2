import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class ProfileAlertDialog extends StatelessWidget {
  ProfileAlertDialog({ Key? key }) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _pageWidth = MediaQuery.of(context).size.width;
    _controller.text = 'Gatinho\'s Bar e Restaurante';
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 24),
      title: const Text('Editar perfil'),
      content: SizedBox(
        width: _pageWidth * 0.4,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: InkWell(
                    onTap: () {
                      showDialog(context: context, builder: (_) => UploadImageDialog());
                    },
                    child: const CircleAvatar(
                      minRadius: 45,
                      backgroundImage: null,
                    ),
                  ),
                ),
                const Text('nome do restaurante')
              ],
            ),
            const Center(
              child: Text("Todo o resto."),
            ),
          ],
        ),
      ),
    );
  }
}


class UploadImageDialog extends StatefulWidget {
  const UploadImageDialog({ Key? key }) : super(key: key);

  @override
  State<UploadImageDialog> createState() => _UploadImageDialogState();
}

class _UploadImageDialogState extends State<UploadImageDialog> {

  late DropzoneViewController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(8),
      title: const Text("Alterar imagem de perfil"),
      content: Container(
        height: 220,
        width: 320,
        color: secondaryColor,
        child: Stack(
          children: [
            DropzoneView(
              onDrop: imageReceiver,
              onCreated: (controller) => this.controller = controller,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.insert_photo),
                  const Text('Arraste uma imagem aqui', style: TextStyle(color: Colors.white,)),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Ou', style: TextStyle(color: Colors.white,)),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () async {
                      final event = await controller.pickFiles();
                      imageReceiver(event.last);
                    },
                    icon: const Icon(Icons.search, color: Colors.black,),
                    label: const Text("Procurar Arquivo", style: TextStyle(color: Colors.black,)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future imageReceiver (dynamic e) async {
    final url = await controller.createFileUrl(e);
    print(url);
  }
}