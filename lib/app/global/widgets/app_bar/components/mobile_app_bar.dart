import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      backgroundColor: primaryCollor,
      elevation: 2,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MouseRegion(
            //Imagem como botão para Filtros
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Image.asset(
                "assets/images/filter.png",
                width: MediaQuery.of(context).size.width * 0.08,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: const Text(
                      //Título acima do endereço
                      "ENTREGAR EM",
                      style: TextStyle(
                        color: tertiaryCollor,
                        fontSize: 10,
                        fontFamily: 'Nunito',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      width: MediaQuery.of(context).size.width * 0.002,
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
                            fontFamily: 'Nunito',
                            fontSize: 10,
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
                        onTap: () => Scaffold.of(context).openEndDrawer(),
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
    );
  }
}
