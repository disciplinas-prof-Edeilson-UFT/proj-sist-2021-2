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
    homeStore.controller['Categoria']?.text = 'Açaí';

    return Column(
      children: [
        Align(
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
                  value: homeStore.selectedCategory,
                  style: fieldLabelStyle(),
                  icon: const Icon(Icons.expand_more),
                  iconEnabledColor: secondaryColor,
                  onChanged: (String? newValue) {
                    homeStore.setSelectedCategory(newValue);
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
      ],
    );
  }
}
