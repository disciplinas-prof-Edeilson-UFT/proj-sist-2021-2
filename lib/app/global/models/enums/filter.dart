enum FilterType {
  avaliation,
  freeShipping,
  discountCoupon,
  shortestDistance,
  alphabeticalOrder,
}

extension FilterExtension on FilterType {
  String get filterFrontEnd {
    switch (this) {
      case FilterType.avaliation:
        return 'Avaliação';
      case FilterType.freeShipping:
        return 'Menor Frete';
      case FilterType.discountCoupon:
        return 'Cupom de Desconto';
      case FilterType.shortestDistance:
        return 'Menor Distância';
      default:
        return 'Ordem Alfabética';
    }
  }

  String get filterBackEnd {
    switch (this) {
      case FilterType.avaliation:
        return 'avaliation';
      case FilterType.freeShipping:
        return 'deliveryPrice';
      case FilterType.discountCoupon:
        return 'cupom';
      case FilterType.shortestDistance:
        return 'distance';
      default:
        return 'socialName';
    }
  }

  String get image {
    return toString().split('.')[1];
  }
}
