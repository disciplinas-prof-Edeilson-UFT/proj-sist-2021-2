import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/repositories/restaurant_home/profile/profile_repository.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/components_profile_dialog.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_adress/address_formulary.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class AddressDialog extends StatelessWidget {
  AddressDialog({Key? key}) : super(key: key);

  final RestaurantHomeStore homeStore = Modular.get<RestaurantHomeStore>();

  @override
  Widget build(BuildContext context) {
    double _pageWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 10),
      title: const Text('Endereço'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: _pageWidth * 0.4,
          child: Column(
            children: [
              AddressFormulary(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
                child: ConfirmationButton(
                  onPressed: () async {
                    await ProfileRepository()
                        .setRestaurant(homeStore.restaurant!);
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
