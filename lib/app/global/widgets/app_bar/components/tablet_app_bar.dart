import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/home_page.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class TabletAppBar extends StatelessWidget {
  const TabletAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      backgroundColor: primaryCollor,
      elevation: 2,
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MouseRegion(
              //Logo PSfood -> HomePage refresh
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
            ),
            MouseRegion(
              //Imagem como botão para Filtros
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Image.asset(
                  "assets/images/filter.png",
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                onTap: () {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            MouseRegion(
              // Aparece o filtro que foi selecionado
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: const Text(
                  //Texto de ilustração do filtro "Ordem Alfabética" selecionado
                  "Ordem Alfabética",
                  style: TextStyle(
                    fontSize: 10,
                    color: tertiaryCollor,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0,
            ),
            MouseRegion(
              //Continuação de Filtro - botão seta
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: secondaryCollor,
                ),
                onTap: () {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Column(
              children: [
                const Text(
                  //Título acima do endereço
                  "ENTREGAR EM",
                  style: TextStyle(
                    color: tertiaryCollor,
                    fontSize: 12,
                    fontFamily: 'Nunito',
                  ),
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    MouseRegion(
                      //Icon location vermelho ao lado do endereço
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: const Icon(
                          Icons.add_location_outlined,
                          color: secondaryCollor,
                          size: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.001,
                    ),
                    MouseRegion(
                      //Endereço
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: const Text(
                          //Exemplo do que seria adicionado como endereço
                          "Q. 208 Sul, Alameda 10, 202",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Nunito',
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    MouseRegion(
                      //Botão icon seta
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: secondaryCollor,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      titleSpacing: 0.0,
      centerTitle: false,
      actions: [
        MouseRegion(
          //Botão direcionado à pagina de cadastro e login
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: Image.asset(
              "assets/images/user.png",
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            onTap: () {},
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        MouseRegion(
          //Botão direcionaro à aba carrinho de compras
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: Image.asset(
              "assets/images/cart.png",
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            onTap: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
      ],
    );
  }
}
