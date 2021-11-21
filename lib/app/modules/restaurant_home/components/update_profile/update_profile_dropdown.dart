import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class UpdateProfileDropdown extends StatefulWidget {
  const UpdateProfileDropdown({Key? key}) : super(key: key);

  @override
  _UpdateProfileDropdownState createState() => _UpdateProfileDropdownState();
}

class _UpdateProfileDropdownState extends State<UpdateProfileDropdown> {
  final RestaurantHomeStore homeStore = Modular.get<RestaurantHomeStore>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Especialidade da loja',
                  style: fieldLabelStyle(),
                ),
                Observer(
                  builder: (ctx) => DropdownButton<String>(
                    value: homeStore.category,
                    style: fieldLabelStyle(),
                    icon: const Icon(Icons.expand_more),
                    iconEnabledColor: secondaryColor,
                    onChanged: (String? newValue) {
                      homeStore.category = newValue ?? homeStore.categories[0];
                    },
                    elevation: 2,
                    underline: Container(
                      color: secondaryColor,
                      height: 2.0,
                    ),
                    items: homeStore.categories.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
