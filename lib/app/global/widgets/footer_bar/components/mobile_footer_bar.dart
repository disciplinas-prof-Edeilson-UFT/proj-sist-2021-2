import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MobileFooterBar extends StatelessWidget {
  const MobileFooterBar({
    Key? key,
    required this.ifood,
    required this.descubra,
  }) : super(key: key);
  final List<String> ifood;
  final List<String> descubra;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Container(
      height: 600,
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 50),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: screen.width * .3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('psfood'),
                    ListView.builder(
                      itemCount: ifood.length,
                      itemBuilder: (_, index) {
                        return TextButton(
                          style: ButtonStyle(foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Colors.black;
                            return Colors.grey;
                          })),
                          onPressed: () {},
                          child: Text(ifood[index]),
                        );
                      },
                      shrinkWrap: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screen.width * .3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Descubra'),
                    ListView.builder(
                      itemCount: descubra.length,
                      itemBuilder: (_, index) {
                        return TextButton(
                          style: ButtonStyle(foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Colors.black;
                            return Colors.grey;
                          })),
                          onPressed: () {},
                          child: Text(descubra[index]),
                        );
                      },
                      shrinkWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 200,
            child: Column(
              children: [
                const Text('Social'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: 50,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.facebook),
                        )),
                    SizedBox(
                        width: 50,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.twitter),
                        )),
                    SizedBox(
                        width: 50,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.youtube),
                        )),
                    SizedBox(
                        width: 50,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.instagram),
                        )),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            height: 20,
            thickness: 2,
            color: Colors.black38,
          ),
          const SizedBox(height: 50),
          Column(
            children: [
              SizedBox(
                  width: 200,
                  height: 140,
                  child: Image.asset('assets/images/logo.png')),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: const [
                      Text(
                        '© Copyright 2021 - Psfood - Todos os direitos reservados\n Psfood com Agência de Restaurantes Online S.A.',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'nunito',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'CNPJ 87.255.036/0001-02 \n Avenida dos afogados, nº 86, Palmas/TO -',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'nunito',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'CEP 06.020-902',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'nunito',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              TextButton(
                style: ButtonStyle(foregroundColor:
                    MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Colors.black;
                  return Colors.grey;
                })),
                onPressed: () {},
                child: const Text(
                  'Termos e condições de uso',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
