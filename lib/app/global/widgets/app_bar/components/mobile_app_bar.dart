import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [Container()],
      backgroundColor: Colors.grey[100],
      elevation: 2,
      centerTitle: true,
      title: SizedBox(
        width: screen.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              width: 90,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person_outline),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ],
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.red),
    );
  }
}
