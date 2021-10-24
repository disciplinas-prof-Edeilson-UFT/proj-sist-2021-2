import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        fixedSize: Size(double.infinity, 20),
        primary: Color(0XFFea1d2c),
        backgroundColor: Colors.white,
      ),
      child: const Text(
        'Fechar Loja',
        style: const TextStyle(
          fontSize: 16,
          fontFamily: "Nunito",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
