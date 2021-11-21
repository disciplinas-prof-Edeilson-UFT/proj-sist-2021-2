import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_adress/adress_dialog.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_profile/profile_alert_dialog.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_sensitive_data/management_dialog.dart';

class RestaurantDialog extends StatelessWidget {
  const RestaurantDialog({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: AlertDialog(
        title: TabBar(
          indicatorColor: secondaryColor,
          labelColor: Colors.black,
          tabs: [
            profileTab('Editar perfil'),
            profileTab('Editar cadastro'),
            profileTab('Editar Endereço'),
          ],
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          child: TabBarView(
            children: [
              const ProfileAlertDialog(),
              const ManagementDialog(),
              AdressDialog(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileTab(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text),
    );
  }

}