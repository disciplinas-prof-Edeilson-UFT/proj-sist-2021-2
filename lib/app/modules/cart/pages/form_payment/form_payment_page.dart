import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
//import 'package:pscomidas/app/modules/cart/pages/add_card/add_card_page.dart';
import 'package:pscomidas/app/modules/cart/pages/form_payment/form_payment_store.dart';

class FormPaymentPage extends StatefulWidget {
  static String routeName = "/form_payment";

  final String title;
  const FormPaymentPage({Key? key, this.title = 'FormPaymentPage'})
      : super(key: key);
  @override
  FormPaymentPageState createState() => FormPaymentPageState();
}

class FormPaymentPageState extends State<FormPaymentPage> {
  final FormPaymentStore controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: screenSize.height * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Modular.to.navigate('/');
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      'Formas de pagamento',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.027,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              SizedBox(
                  width: screenSize.width * 0.5,
                  height: screenSize.height * 0.3,
                  child: Observer(builder: (_) {
                    return ListViewCard(controller);
                  })),
              SizedBox(
                height: screenSize.height * 0.02,
              ),

              // Botão de adicionar formas pagamento

              // Container(
              //   padding: EdgeInsets.all(10),
              //   width: screenSize.width * 0.5,
              //   color: Colors.red,
              //   child: TextButton(
              //     style: TextButton.styleFrom(primary: Colors.white),
              //     onPressed: () {
              //       Modular.to.pushNamed(AddCardPage.routeName);
              //     },
              //     child: Text('Adicionar forma de pagamento'),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

Widget ListViewCard(var controller) {
  String getLastChars(String numero) {
    var tamanho = numero.length;
    var start = tamanho == 16 ? 12 : 10;
    var end = tamanho;
    var lastChars = numero.substring(start, end);
    return lastChars;
  }

  return ListView.builder(
      itemCount: controller.listCard.length,
      itemBuilder: (_, index) {
        var card = controller.listCard[index];
        return Card(
            child: InkWell(
          splashColor: Colors.red.withAlpha(30),
          onTap: () => null,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(card.apelido),
                    Text(
                      '... ${getLastChars(card.numero_cartao)}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
              ],
            ),
          ),
        ));
      });
}
