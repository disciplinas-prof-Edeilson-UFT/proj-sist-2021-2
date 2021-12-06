import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class TabletFooterBar extends StatelessWidget {
  const TabletFooterBar({
    Key? key,
    required this.ifood,
    required this.descubra,
    required this.social,
  }) : super(key: key);
  final List<String> ifood;
  final List<String> descubra;
  final List<Buttons> social;
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Container(
      height: 300,
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: screen.width * .3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('iFood'),
                    ListView.builder(
                      itemCount: ifood.length,
                      itemBuilder: (_, index) {
                        return TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.black38,
                          ),
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
                          style: TextButton.styleFrom(
                            primary: Colors.black38,
                          ),
                          onPressed: () {},
                          child: Text(descubra[index]),
                        );
                      },
                      shrinkWrap: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screen.width * .2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Social'),
                    SizedBox(
                      width: 50,
                      child: ListView.builder(
                        itemCount: social.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SignInButton(
                              social[index],
                              onPressed: () => null,
                              mini: true,
                            ),
                          );
                        },
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 2,
            color: Colors.black38,
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: 70,
                  height: 70,
                  child: Image.asset('assets/images/logo.png')),
              Column(
                children: const [
                  Text(
                    '© Copyright 2021 - iFood - Todos os direitos reservados iFood com Agência de',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'Restaurantes Online S.A.',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'CNPJ 14.380.200/0001-21 / Avenida dos Autonomistas, nº 1496, Vila Yara, Osasco/SP -',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'CEP 06.020-902',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black38,
                ),
                onPressed: () {},
                child: const Text(
                  'Termos e condições de uso',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black38,
                ),
                onPressed: () {},
                child: const Text(
                  'Código de conduta',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black38,
                ),
                onPressed: () {},
                child: const Text(
                  'privacidade',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black38,
                ),
                onPressed: () {},
                child: const Text(
                  'Dicas de segurança',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
