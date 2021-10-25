import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Button extends StatelessWidget {
  final String text;
  final dynamic onPressed;

  Button(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        fixedSize: Size(MediaQuery.of(context).size.width * 0.2,
            MediaQuery.of(context).size.height * 0.04),
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
