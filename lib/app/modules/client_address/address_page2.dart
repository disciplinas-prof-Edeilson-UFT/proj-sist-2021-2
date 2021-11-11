

//Esse arquivo é apenas para mostrar como página vai ficar uma segunda tela, ainda vai precisar ser adicionada junto com a página principal, 
//para testar vai precisar mudar o caminho em components_app_bar.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';


class ClientAddressPage2 extends StatefulWidget {
  const ClientAddressPage2({Key? key}) : super(key: key);

  @override
  _ClientAddress2State createState() => _ClientAddress2State();
}

class _ClientAddress2State extends State<ClientAddressPage2> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return AlertDialog(
      content: SizedBox(
        width: screen.width * .5,
        height: 500,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 185.0,
                  width: screen.width * .2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://i.imgur.com/ig0zI1u.jpg'),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Nenhum resultado perto de você",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                    ),
                  ),
                ),
                TextField(
                  controller: _controller,
                  textInputAction: TextInputAction.newline,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Busque endereço e número',
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: secondaryCollor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    suffixIcon: _controller.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.cancel_sharp,
                              color: Colors.grey,
                              size: 20,
                            ),
                            onPressed: () {
                              _controller.clear();
                            },
                          )
                        : null,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      "Verifique o nome e número do local e\n               busque novamente",
                      style: TextStyle(
                        color: tertiaryCollor,
                        fontSize: 16,
                      )),
                ),
                CupertinoButton(
                  child: const Text(
                    "Buscar pelo mapa",
                    style: TextStyle(
                      color: secondaryCollor,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
