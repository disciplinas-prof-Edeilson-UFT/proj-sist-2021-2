import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pscomidas/app/global/widgets/footer_bar/components/about_project.dart';
import 'package:pscomidas/app/global/widgets/footer_bar/components/itens.dart';
import 'components/section_column.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 32, top: 56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: screenSize.width * .25,
                child: const SectionColumn(
                  section: "PsFood", 
                  itens: SectionItens.psFood,
                ),
              ),
              SizedBox(
                width: screenSize.width * .25 < 190 ? 190 : screenSize.width * .25,
                child: SectionColumn(
                  section: "Parceiros", 
                  itens: SectionItens.partners,
                ),
              ),
              SizedBox(
                width: screenSize.width * .25,
                child: Column(
                  children: [
                    const Text('Sobre o projeto',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        AboutProject(
                          url: "https://github.com/disciplinas-prof-Edeilson-UFT/"
                            "proj-sist-2021-2/tree/gh-pages", 
                          icon: FontAwesomeIcons.github),
                        AboutProject(
                          url: "https://trello.com/b/XAtOtlEb/ps-comidas-projeto-de-sistemas-2021-2", 
                          icon: FontAwesomeIcons.trello,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            height: 18,
            thickness: 1,
            color: Colors.black38,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: screenSize.width * 0.1,
              ),
              SizedBox(
                width: screenSize.width * 0.75,
                child: Column(
                  children: const [
                    Text(
                      '© Copyright 2021 - Psfood - Todos os direitos reservados',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'nunito',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'PsFood é um projeto desenvolvido em colaboração pela turma de Projeto de Sistemas'
                        ' 2021/2 da Universidade Federal do Tocantins.',
                      style: TextStyle(
                        overflow: TextOverflow.clip,
                        fontSize: 12,
                        fontFamily: 'nunito',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
