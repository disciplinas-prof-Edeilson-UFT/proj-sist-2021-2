// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:pscomidas/app/global/widgets/card/components/buttons/buttonCard.dart';
// import 'package:pscomidas/app/global/widgets/card/components/textField/texField.dart';
// import 'package:pscomidas/app/modules/cart/pages/add_card/validation/card_validation.dart';

// class AddCardPage extends StatefulWidget {
//   static String routeName = "/add_card";
//   final String title;
//   const AddCardPage({this.title = 'AddCardPage'});
//   @override
//   AddCardPageState createState() => AddCardPageState();
// }

// class AddCardPageState extends State<AddCardPage> {
//   var store = CardValidation();
//   bool typeCardChosen = false;

//   @override
//   Widget build(BuildContext context) {
//     return !typeCardChosen ? TypeCard() : FormAddCard(store: store);
//   }

//   Widget TypeCard() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           width: 100,
//           child: TextButton(
//             style: TextButton.styleFrom(primary: Colors.black),
//             onPressed: () {
//               Modular.to.navigate('/formPayments');
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.arrow_back_ios),
//                 Text('Voltar'),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         ButtonCard(
//           name_button: 'Débito',
//           onPressed: () {
//             setState(() {
//               typeCardChosen = true;
//             });
//           },
//           type: 'Débito',
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         ButtonCard(
//           name_button: 'Crédito',
//           onPressed: () {
//             setState(() {
//               typeCardChosen = true;
//             });
//           },
//           type: 'Crédito',
//         ),
//       ],
//     );
//   }
// }

// class FormAddCard extends StatelessWidget {
//   CardValidation store;
//   FormAddCard({Key? key, required this.store}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//         body: SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(50.0),
//         child: Container(
//           width: screenSize.width * 0.4,
//           child: LayoutBuilder(
//             builder: (_, constraints) {
//               return ListView(
//                 children: [
//                   Row(children: [
//                     IconButton(
//                         onPressed: () {
//                           Modular.to.navigate('/formPayments');
//                         },
//                         icon: Icon(Icons.arrow_back_ios)),
//                     // Text(store.card.type),
//                   ]),
//                   Observer(builder: (_) {
//                     return TextFieldCard(
//                         labelText: 'Número do cartão',
//                         // onChanged: store.card.setNumero_cartao,
//                         errorText: store.validationNumeroCartao);
//                     //return textFormField(labelText: 'teste', onChanged: store.card.setNumero_cartao);
//                   }),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Observer(builder: (_) {
//                     return TextFieldCard(
//                         labelText: 'Nome impresso no cartão',
//                         // onChanged: store.card.setNome_impresso,
//                         errorText: store.validationNomeImpresso);
//                   }),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                           width: constraints.maxWidth * 0.45,
//                           child: TextFieldCard(
//                               labelText: 'Validade',
//                               // onChanged: store.card.setValidade,
//                               errorText: store.validationValidade)),
//                       Container(
//                           width: constraints.maxWidth * 0.45,
//                           child: TextFieldCard(
//                               labelText: 'CVV',
//                               // onChanged: store.card.setCvv,
//                               errorText: store.validationCVV)),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Observer(builder: (_) {
//                     return TextFieldCard(
//                         labelText: 'Apelido do cartão',
//                         // onChanged: store.card.setApelido,
//                         errorText: store.validationApelido);
//                   }),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Observer(builder: (_) {
//                     return TextFieldCard(
//                         labelText: 'CPF/CNPJ do titular',
//                         // onChanged: store.card.setCpf_cnpj,
//                         errorText: store.validationCPF_CNPJ);
//                   }),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   _buttonAddCard(context, store),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     ));
//   }
// }

// Widget _buttonAddCard(BuildContext context, CardValidation store) {
//   var screenSize = MediaQuery.of(context).size;
//   return Observer(builder: (_) {
//     return Container(
//       width: screenSize.width * 0.05,
//       height: screenSize.height * 0.07,
//       color: store.isValid() ? Colors.red : Colors.grey[350],
//       child: TextButton(
//         style: TextButton.styleFrom(
//           primary: Colors.white,
//         ),
//         onPressed: store.isValid()
//             ? () {
//                 // Adicionar função para passar os dados do cartão para o Firebase
//                 print('Cartão adicionado');
//               }
//             : null,
//         child: Text('Adicionar Cartão'),
//       ),
//     );
//   });
// }
