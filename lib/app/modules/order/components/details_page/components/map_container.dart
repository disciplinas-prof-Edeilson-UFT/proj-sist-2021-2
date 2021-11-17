import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/components/details_page/components/store_map_builder.dart';

class MapContainer extends StatelessWidget {
  const MapContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(3),
      width: screen.width * 0.35,
      height: screen.height * 0.60,
      child: const StoreMapBuilder(),
    );
  }
}
