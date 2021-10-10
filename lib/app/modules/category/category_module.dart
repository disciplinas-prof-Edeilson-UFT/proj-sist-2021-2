import 'package:pscomidas/app/modules/category/category_page.dart';
import 'package:pscomidas/app/modules/category/category_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CategoryStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CategoryPage()),
  ];
}
