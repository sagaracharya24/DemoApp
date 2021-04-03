import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_app_sample/utils/constants.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;
  @required
  final double radius;
  var isBorderAvailable = false;

  CircleImage({this.imageUrl, this.radius, this.isBorderAvailable});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${ApiBase.baseUrl}member-login$imageUrl",
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              border: isBorderAvailable
                  ? Border.all(
                      color: Colors.white,
                      width: 8.0,
                    )
                  : null,
              borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        );
      },
      placeholder: (context, url) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return Center(child: Icon(Icons.error));
      },
    );
  }
}
