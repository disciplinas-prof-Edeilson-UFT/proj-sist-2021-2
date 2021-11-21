import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/components_profile_dialog.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_adress/address_formulary.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class AddressDialog extends StatelessWidget {
  AddressDialog({Key? key}) : super(key: key);

  final RestaurantHomeStore homeStore = Modular.get<RestaurantHomeStore>();

  @override
  Widget build(BuildContext context) {
    double _pageWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const NextIcon(currentState: 'Endereco', direction: 'Anterior'),
        Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              width: _pageWidth * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AddressFormulary(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0),
                    child: ConfirmationButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
