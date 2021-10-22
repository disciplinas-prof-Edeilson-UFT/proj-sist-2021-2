import 'package:cloud_firestore/cloud_firestore.dart';

class Rating {
  String? comentario;
  double nota;

  Rating({this.comentario, required this.nota});
}
