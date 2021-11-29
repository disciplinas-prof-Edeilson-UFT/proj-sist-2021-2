import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class RestaurantPicture extends StatelessWidget {
  const RestaurantPicture({Key? key, required this.picture}) : super(key: key);
  final loadingIndicator = const CircularProgressIndicator(
    color: secondaryColor,
  );
  final double? size = 45;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: 90,
      imageUrl: picture,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          radius: size,
          backgroundImage: imageProvider,
          backgroundColor: Colors.transparent,
        );
      },
      placeholder: (context, url) => picturePlaceholder(),
    );
  }

  Widget picturePlaceholder() {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      minRadius: size,
      child: loadingIndicator,
    );
  }
}
