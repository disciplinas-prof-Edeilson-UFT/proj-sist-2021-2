import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_profile/update_formulary.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'profile_picture_dialog.dart';

class ProfileAlertDialog extends StatelessWidget {
  ProfileAlertDialog({Key? key}) : super(key: key);
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
                      showDialog(
                          context: context,
                          builder: (_) => const ProfilePictureDialog());
                    },
                    borderRadius: BorderRadius.circular(90),
                    child: SizedBox(
                      height: 90,
                      width: 90,
                      child: Observer(builder: (_) {
                        return Stack(
                          children: [
                            if (store.showLoading)
                              const Center(
                                  child: CircularProgressIndicator(
                                color: secondaryColor,
                              )),
                            CircleAvatar(
                              minRadius: 45,
                              backgroundImage: NetworkImage(store.picture),
                              backgroundColor: Colors.transparent,
                              child: store.editBackground,
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(
                  width: 310,
                  height: 50,
                  child: Expanded(
                    child: TextFormField(
                      controller: _controller,
                      cursorColor: secondaryColor,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                        prefixIcon: Padding(
                          padding:
                              EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
                          child: Icon(Icons.create_outlined),
                        ),
                        focusColor: secondaryColor,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryColor,
                          ),
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            UpdateFormulary(),
          ],
        ),
      ),
    );
  }
}
