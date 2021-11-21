import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/repositories/restaurant_home/profile/profile_repository.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/components_profile_dialog.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_adress/adress_formulary.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class AdressDialog extends StatelessWidget {
  AdressDialog({Key? key}) : super(key: key);

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
                  AdressFormulary(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0),
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
        ),
      ],
    );
  }
}
