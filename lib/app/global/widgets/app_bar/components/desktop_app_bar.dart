import 'package:flutter/material.dart';

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({Key? key}) : super(key: key);

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
        width: screen.width * 0.6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Implementar troca de logo por arrow_back para voltar uma página
            GestureDetector(
              onTap: () {}, //TODO: Navegação para home ao clicar na logo
              child: Container(
                padding: const EdgeInsets.all(8.0),
                width: 90,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Expanded(child: Container()),
            // TODO: Implementar barra de pesquisa com Hero
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: screen.width * .2,
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
