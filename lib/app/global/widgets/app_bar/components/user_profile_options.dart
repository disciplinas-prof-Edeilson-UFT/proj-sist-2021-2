import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/auth/auth_module.dart';
import 'package:pscomidas/app/modules/update_client_data/update_client_data_module.dart';

class ItemMenuHover extends StatefulWidget {
  const ItemMenuHover({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  _ItemMenuHoverState createState() => _ItemMenuHoverState();
}

class _ItemMenuHoverState extends State<ItemMenuHover> {
  Color color = Colors.black54;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) {
        setState(() {
          color = Colors.red;
        });
      },
      onExit: (_) {
        setState(() {
          color = Colors.black54;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 8.0,
            ),
            child: Icon(
              widget.icon,
              color: color,
            ),
          ),
          Expanded(
            child: Text(
              widget.title,
              textAlign: TextAlign.left,
              style: TextStyle(color: color),
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfileOptions {
  static List<PopupMenuItem> listy = [
    PopupMenuItem(
      child: const ItemMenuHover(
        title: "Chats",
        icon: Icons.sms_outlined,
      ),
      padding: const EdgeInsets.all(5.0),
      onTap: () {},
    ),
    PopupMenuItem(
      child: const ItemMenuHover(
        title: "Pedidos",
        icon: Icons.receipt_outlined,
      ),
      padding: const EdgeInsets.all(5.0),
      onTap: () {},
    ),
    PopupMenuItem(
      child: const ItemMenuHover(
        title: "Meus Cupons",
        icon: Icons.local_offer_outlined,
      ),
      padding: const EdgeInsets.all(5.0),
      onTap: () {},
    ),
    PopupMenuItem(
      child: const ItemMenuHover(
        title: "Pagamento",
        icon: Icons.payment_outlined,
      ),
      padding: const EdgeInsets.all(5.0),
      onTap: () {},
    ),
    PopupMenuItem(
      child: const ItemMenuHover(
        title: "Fidelidade",
        icon: Icons.card_giftcard_outlined,
      ),
      padding: const EdgeInsets.all(5.0),
      onTap: () {},
    ),
    PopupMenuItem(
      child: const ItemMenuHover(
        title: "Ajuda",
        icon: Icons.support_outlined,
      ),
      padding: const EdgeInsets.all(5.0),
      onTap: () {},
    ),
    PopupMenuItem(
      child: const ItemMenuHover(
        title: "Editar Dados",
        icon: Icons.settings_outlined,
      ),
      padding: const EdgeInsets.all(5.0),
      onTap: () async {
        Modular.to.navigate(UpdateClientDataModule.routeName);
      },
    ),
    PopupMenuItem(
      child: const ItemMenuHover(
        title: "Segurança",
        icon: Icons.shield_outlined,
      ),
      padding: const EdgeInsets.all(5.0),
      onTap: () {},
    ),
    PopupMenuItem(
      child: const ItemMenuHover(
        title: "Sair",
        icon: Icons.logout_outlined,
      ),
      padding: const EdgeInsets.all(5.0),
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        Modular.to.navigate(AuthModule.routeName);
      },
    ),
  ];
}
