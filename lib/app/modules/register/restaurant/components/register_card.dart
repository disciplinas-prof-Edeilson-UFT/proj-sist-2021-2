import 'package:flutter/material.dart';
 
class RegisterCard extends StatelessWidget {
  RegisterCard({ Key? key }) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
      height: 530,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.black, fontFamily: 'Nunito'),
                children: [
                  TextSpan(
                    text: 'Cadastre sua loja\n', 
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Entre e ganhe 1 mês de mensalidade grátis!', 
                    style: TextStyle(fontSize: 16, ),
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nome completo'),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'João da Silva',
                    ),
                  ),
                  const Text('Email'),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'email@email.com',
                    ),
                  ),
                  const Text('Celular (com DDD)'),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '(00) 00000-0000',
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.validate();
                }, 
                child: const Text('ElevatedButton'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}