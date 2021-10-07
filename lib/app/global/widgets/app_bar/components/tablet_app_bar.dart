import 'package:flutter/material.dart';

class TabletAppBar extends StatelessWidget {
  const TabletAppBar({Key? key}) : super(key: key);

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
        width: screen.width * 0.8,
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: screen.width * .4,
              child: const TextField(
                cursorColor: Colors.red,
                style: TextStyle(),
                decoration: InputDecoration(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                  ),
                  hintText: 'Busque por item ou loja',
                  border: InputBorder.none,
                ),
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
