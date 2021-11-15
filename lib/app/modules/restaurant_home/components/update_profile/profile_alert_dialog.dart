import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_profile/restaurant_profile_picture.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_profile/update_formulary.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'profile_picture_dialog.dart';

class ProfileAlertDialog extends StatefulWidget {
  const ProfileAlertDialog({Key? key}) : super(key: key);

  @override
  _ProfileAlertDialogState createState() => _ProfileAlertDialogState();
}

class _ProfileAlertDialogState extends State<ProfileAlertDialog> {
  late RestaurantHomeStore store;

  @override
  void initState() {
    super.initState();

    store = Modular.get<RestaurantHomeStore>();
    store.profileAlertDialogRestaurantFieldFocus
        .addListener(store.handleFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    double _pageWidth = MediaQuery.of(context).size.width;

    return ListView(
      shrinkWrap: true,
      children: [
        AlertDialog(
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
                        onHover: (_isHovering) =>
                            store.editResolver(_isHovering),
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
                                store.editBackground,
                                RestaurantProfilePicture(
                                  size: 45,
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
                      child: Observer(builder: (context) {
                        return TextFormField(
                          focusNode:
                              store.profileAlertDialogRestaurantFieldFocus,
                          controller: store.updateFormController['restaurant'],
                          cursorColor: secondaryColor,
                          onTap: () => store
                              .profileAlertDialogRestaurantFieldFocus
                              .requestFocus(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Este campo não pode ficar vazio";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(0, 15, 0, 10),
                            prefixIcon: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 8.0, end: 8.0),
                              child: Icon(
                                Icons.create_outlined,
                                color: store.iconColor,
                              ),
                            ),
                            focusColor: redCollor,
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: secondaryColor,
                              ),
                            ),
                            border: const UnderlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        );
                      }),
                    ),
                  ],
                ),
                UpdateFormulary(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
