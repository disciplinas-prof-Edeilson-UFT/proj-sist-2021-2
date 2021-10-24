import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class LogoutButton extends StatefulWidget {
//   const LogoutButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _LogoutButtonState createState() => _LogoutButtonState();
// }

// class _LogoutButtonState extends State<LogoutButton> {
//   String doc = "ZBBWmKihRyQ6nodQcEQJ";
//   late bool _isOpen;

//   void _setOpen(bool isOpen) {
//     setState(() {
//       _isOpen = isOpen;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference restaurant =
//         FirebaseFirestore.instance.collection('restaurant');

//     Future<void> toggleRestaurant() {
//       return restaurant
//           .doc(doc)
//           .update({'is_open': !_isOpen})
//           .then((value) => _setOpen(!_isOpen))
//           .catchError((error) => print("Failed to update restaurant: $error"));
//     }

//     return FutureBuilder<DocumentSnapshot>(
//       future: restaurant.doc(doc).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError || (snapshot.hasData && !snapshot.data!.exists)) {
//           return TextButton(
//             onPressed: null,
//             style: TextButton.styleFrom(
//               fixedSize: Size(double.infinity, 20),
//               primary: Color(0XFFea1d2c),
//               backgroundColor: Colors.white,
//             ),
//             child: Text(
//               'Erro!',
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontFamily: "Nunito",
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           );
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;

//           return TextButton(
//             onPressed: () {
//               _setOpen(data['is_open']);
//             },
//             style: TextButton.styleFrom(
//               fixedSize: Size(double.infinity, 20),
//               primary: Color(0XFFea1d2c),
//               backgroundColor: Colors.white,
//             ),
//             child: Text(
//               data['is_open'] ? 'Fechar Loja' : 'Abrir Loja',
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontFamily: "Nunito",
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           );
//         }

//         return TextButton(
//           onPressed: null,
//           style: TextButton.styleFrom(
//             fixedSize: Size(double.infinity, 20),
//             primary: Color(0XFFea1d2c),
//             backgroundColor: Colors.white,
//           ),
//           child: Text(
//             'Carregando...',
//             style: const TextStyle(
//               fontSize: 16,
//               fontFamily: "Nunito",
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class Button extends StatelessWidget {
  final String text;
  final dynamic onPressed;

  Button(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        fixedSize: Size(double.infinity, 20),
        primary: Color(0XFFea1d2c),
        backgroundColor: Colors.white,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: "Nunito",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class LogoutButton extends StatefulWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  _LogoutButtonState createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  CollectionReference restaurant =
      FirebaseFirestore.instance.collection('restaurant');
  final Stream<DocumentSnapshot> _restaurantStream = FirebaseFirestore.instance
      .collection('restaurant')
      .doc('ZBBWmKihRyQ6nodQcEQJ')
      .snapshots();

  Future<void> toggleRestaurant(bool isOpen) {
    return restaurant
        .doc('ZBBWmKihRyQ6nodQcEQJ')
        .update({'is_open': isOpen})
        .then((value) => print("Restaurant updated"))
        .catchError((error) => print("Failed to update restaurant: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: _restaurantStream,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Button("Erro", null);
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Button("Carregando...", null);
        }

        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;

        return Button(data['is_open'] ? 'Fechar Loja' : 'Abrir Loja', () {
          toggleRestaurant(!data['is_open']);
        });
      },
    );
  }
}
