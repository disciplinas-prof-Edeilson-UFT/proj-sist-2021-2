import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'profile_picture_dialog.dart';

class ProfileAlertDialog extends StatelessWidget {
  ProfileAlertDialog({ Key? key }) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();

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
                    onHover: (_isHovering) => store.editResolver(_isHovering),
                    onTap: () {
                      showDialog(context: context, builder: (_) => const ProfilePictureDialog());
                    },
                    borderRadius: BorderRadius.circular(90),
                    child: SizedBox(
                      height: 90,
                      width: 90,
                      child: Observer(
                        builder: (_) {
                          return Stack(
                            children: [
                              if (store.showLoading)
                                const Center(child: CircularProgressIndicator(color: secondaryColor,)),
                              CircleAvatar(
                                minRadius: 45,
                                backgroundImage: NetworkImage(store.picture),
                                backgroundColor: Colors.transparent,
                                child: store.editBackground,
                              ),
                            ],
                          );
                        }
                      ),
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