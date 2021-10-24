enum OrderType {
  started,
  doing,
  done,
  delivering,
  completed,
}

extension OrderStatus on OrderType {
  String? get label {
    switch (this) {
      case OrderType.started:
        return 'Pedido Aceito';
      case OrderType.doing:
        return 'Preparando Pedido';
      case OrderType.done:
        return 'Pedido Pronto';
      case OrderType.delivering:
        return 'Saiu para entrega';
      case OrderType.completed:
        return 'Pedido Completo';
      default:
        return null;
    }
  }

  String get databaseString {
    switch (this) {
      case OrderType.started:
        return 'started';
      case OrderType.doing:
        return 'doing';
      case OrderType.done:
        return 'done';
      case OrderType.delivering:
        return 'delivering';
      case OrderType.completed:
        return 'completed';
      default:
        return '';
    }
  }
}
