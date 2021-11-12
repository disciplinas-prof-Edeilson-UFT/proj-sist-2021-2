import 'package:flutter/material.dart';
import 'update_profile_picture.dart';

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
                      showDialog(context: context, builder: (_) => const UploadImageDialog());
                    },
                    child: const CircleAvatar(
                      minRadius: 45,
                      backgroundImage: null,
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: const [
                Text("Como este card NÃO faz parte das requisições do R09, esta área ficará em branco"
                " e inoperante. Trata-se da PROPOSIÇÃO da área onde o restaurante editará informações"
               " importantes como nome, imagem de perfil (o upload da imagem já está implementado, "
               " basta clicar no CircleAvatar azul), categoria de serviço, etc.")
              ],
            ),
          ],
        ),
      ),
    );
  }
}