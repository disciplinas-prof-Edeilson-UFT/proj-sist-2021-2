import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class RestaurantProfilePicture extends StatelessWidget {
  RestaurantProfilePicture({Key? key, this.size}) : super(key: key);
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();
  final loadingIndicator = const CircularProgressIndicator(
    color: secondaryColor,
  );
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (store.picture == '') {
        return picturePlaceholder();
      }
      return CachedNetworkImage(
        imageUrl: store.picture,
        imageBuilder: (context, imageProvider) {
          return CircleAvatar(
            minRadius: size,
            backgroundImage: imageProvider,
            backgroundColor: Colors.transparent,
            child: store.editBackground,
          );
        },
        placeholder: (context, url) => picturePlaceholder(),
      );
    });
  }

  Widget picturePlaceholder() {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      minRadius: size,
      child: loadingIndicator,
    );
  }
}
