import 'dart:developer';

import "package:google_maps_webservice/places.dart";
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';

class ClientAddressRepository {
  Future<void>? fechPlace(String pedido) async {
    final places =
        new GoogleMapsPlaces(apiKey: "AIzaSyCQQH3TeTUR5LWAYoHddUSLXZ6KsCVv9YI");
    try {
      PlacesSearchResponse response = await places.searchByText(pedido);
      log(response.status);
      PlacesSearchResult teste;
    } catch (e) {
      throw Exception("Pedido não encontrado");
    }
  }
}
