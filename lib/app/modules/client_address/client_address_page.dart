import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class ClientAddressPage extends StatefulWidget {
  const ClientAddressPage({Key? key}) : super(key: key);

  @override
  _ClientAddressState createState() => _ClientAddressState();
}

class _ClientAddressState extends State<ClientAddressPage> {
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
        height: 550,
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
                      image: NetworkImage('https://i.imgur.com/50wsQ3L.jpg'),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Onde você quer receber seu pedido?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
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
                MouseRegion(
                  child: GestureDetector(
                    child: const ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(
                        "Universidade Federal do Tocantins",
                      ),
                      subtitle: Text("Plano Diretor Sul, Palmas - TO, Brasil"),
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: const ListTile(
                      leading: Icon(Icons.map),
                      title: Text(
                        "Não achei meu endereço",
                        style: TextStyle(
                          color: secondaryCollor,
                        ),
                      ),
                      subtitle: Text("Buscar pelo mapa"),
                    ),
                    onTap: () {},
                  ),
                ),
                Slidable(
                  actionPane: const SlidableBehindActionPane(),
                  actions: [
                    IconSlideAction(
                      icon: Icons.edit,
                      color: Colors.transparent,
                      foregroundColor: secondaryCollor,
                      onTap: (){},
                    ),
                    IconSlideAction(
                      icon: Icons.delete,
                      color: Colors.transparent,
                      foregroundColor: secondaryCollor,
                      onTap: (){},
                    ),
                  ],
                  actionExtentRatio: 1/15,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.house),
                            trailing: const Icon(Icons.toggle_on),
                            title: const Text(
                              "Casa",
                            ),
                            subtitle: const Text("Q. 208 Sul, Alameda 10, 202"),
                            onTap: () {},
                          ),
                        ],
                      ),
                     /* SizedBox(
                        height: 75,
                        width: screen.width * .5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.more_vert,
                                color: tertiaryCollor,
                              ),
                              onPressed: () {
                              },
                            ),
                          ],
                        ),
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
