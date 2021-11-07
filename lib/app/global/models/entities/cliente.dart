class Cliente {
  final String name;
  final String cpf;
  final String? uid;
  final String email;
  final String phone;

  Cliente({
    required this.name,
    required this.cpf,
    this.uid,
    required this.email,
    required this.phone,
  });
}
