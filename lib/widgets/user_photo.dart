import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class UserPhoto extends StatelessWidget {
  final String autorAvatarUrl;
  
  UserPhoto(
    this.autorAvatarUrl
  );
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: CachedNetworkImageProvider(autorAvatarUrl)
        )
      ),
    );
  }
}