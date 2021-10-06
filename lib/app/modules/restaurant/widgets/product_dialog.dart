import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:flutter/material.dart';

class ProductDialog extends StatefulWidget {
  final String title;

  const ProductDialog({Key? key, this.title = 'ProductDialog'})
      : super(key: key);

  @override
  ProductDialogState createState() => ProductDialogState();
}

class ProductDialogState extends State<ProductDialog> {
  final RestaurantStore store = Modular.get();

  int _contador = 0;

  final List<String> _items = [
    "Item 1",
    "Item 2",
  ];

  String _itematual = "Item 1";

  void _increment(setState) {
    setState(() {
      _contador++;
    });
  }

  void _decrement(setState) {
    if (_contador < 1) {
      return;
    }
    setState(() {
      _contador--;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return AlertDialog(
      title: Text(
        'X-tudão',
        textAlign: TextAlign.center,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 500.0,
            width: 500.0,
            decoration: const BoxDecoration(
              color: Colors.red,
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: AssetImage("logos/produto1.jpeg"),
              // ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ListTile(
                title: Text("COCA-COLA 600ML\nR\$ 3.00"),
                subtitle: Text("Imagem Meramente Ilustrativa."),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 80,
                width: 500,
                child: ListTile(
                  trailing: Radio(
                    activeColor: Colors.red,
                    value: _items[0],
                    groupValue: _itematual,
                    onChanged: (String? newValue) {
                      setState(() {
                        _itematual = newValue!;
                      });
                    },
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Copo \n",
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "+ R\$ 1.00",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  onLongPress: () {},
                ),
              ),
              SizedBox(
                height: 80,
                width: 500,
                child: ListTile(
                  trailing: Radio(
                    activeColor: Colors.red,
                    value: _items[1],
                    groupValue: _itematual,
                    onChanged: (String? newValue) {
                      setState(() {
                        _itematual = newValue!;
                      });
                    },
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Gelo \n",
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "+ R\$ 1.00",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  onLongPress: () {},
                ),
              ),
              const SizedBox(height: 1),
              SizedBox(
                height: 80,
                width: 500,
                child: ListTile(
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.red,
                    ),
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Canudo \n",
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "+ R\$ 0.50",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  onLongPress: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 500,
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Algum comentário?",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                width: 500,
                height: 150,
                child: const TextField(
                  textInputAction: TextInputAction.newline,
                  autofocus: true,
                  maxLength: 150,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Ex: tirar cebola, maionese à parte, etc.",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => _decrement(setState),
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.white,
                          child: Center(
                            child: Text("$_contador"),
                          ),
                        ),
                        IconButton(
                          onPressed: () => _increment(setState),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 55,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          onPrimary: Colors.black,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Adicionar",
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Positioned(
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.close, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
