class Cliente {
  final String name;
  final String cpf;
  final String? uid;
  final String email;

  Cliente({
    required this.name,
    required this.cpf,
    this.uid,
    required this.email,
  });
}
