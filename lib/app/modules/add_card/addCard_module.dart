// ignore_for_file: file_names


import 'package:flutter_modular/flutter_modular.dart';

import 'addCard_page.dart';

class AddCardModule extends Module {
  @override
  final List<Bind> binds = [

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AddCardPage()),
  ];
}
