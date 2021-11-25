class DeliveryAt {
  final String street;
  final String block;
  final String complement;
  final int? number;
  final String cep;
  final String city;
  final String uf;
  final bool active;

  DeliveryAt({
    this.active = false,
    required this.street,
    required this.block,
    required this.complement,
    required this.number,
    required this.cep,
    this.city = 'Palmas',
    this.uf = 'TO',
  });
}
