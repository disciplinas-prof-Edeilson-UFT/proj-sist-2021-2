import 'package:pscomidas/app/modules/restaurant/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  @override
  final bool available;
  final String name;
  final String categories;
  final String img;
  final String description;
  final double price;

  ResultSearchModel(this.available, this.name, this.categories, this.img,
      this.description, this.price)
      : super(false, '', '', '', '', 0.0);

  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'name': name,
      'categories': categories,
      'img': img,
      'description': description,
      'price': price,
    };
  }

  static ResultSearchModel fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      map['available'],
      map['name'],
      map['categories'],
      map['img'],
      map['description'],
      map['price'],
    );
  }
}
