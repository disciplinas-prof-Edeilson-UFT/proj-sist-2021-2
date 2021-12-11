import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum FilterAddressType {
  casa,
  trabalho,
  outro,
}

extension FilterExtension on FilterAddressType {
  String get label {
    switch (this) {
      case FilterAddressType.casa:
        return 'Casa';
      case FilterAddressType.trabalho:
        return 'Trabalho';
      default:
        return 'Outro';
    }
  }

  IconData get icon {
    switch (this) {
      case FilterAddressType.casa:
        return Icons.house;
      case FilterAddressType.trabalho:
        return Icons.home_work_rounded;
      default:
        return Icons.location_on_outlined;
    }
  }

  FilterAddressType stringTotype(String? label) {
    switch (label) {
      case 'casa':
        return FilterAddressType.casa;
      case 'trabalho':
        return FilterAddressType.trabalho;
      default:
        return FilterAddressType.outro;
    }
  }
}
