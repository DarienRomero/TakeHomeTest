import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
/*IMPORTANT: Code modified from: https://medium.com/flutter-community/easy-skeleton-views-in-flutter-using-shimmer-package-acdde0288e1b
            by: Dane Mackier */

class CommitsListSkeleton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[200],
        highlightColor: Colors.white,
        child: ListItem(width)),
    );
  }
}
class ListItem extends StatelessWidget {
  final double width;
  ListItem(this.width);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.blue,
            ),
            margin: EdgeInsets.only(right: 10.0),
          ),
          Container(
            height: 100.0,
            width: width - 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}