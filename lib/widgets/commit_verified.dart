import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommitVerified extends StatelessWidget {
  final bool verified;
  
  CommitVerified(
    this.verified
  );

  @override
  Widget build(BuildContext context) {
    return verified ? Container(
      padding: EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 10,
        right: 10
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.green[100]
      ),
      child: Row(
        children: [
          Icon(FontAwesomeIcons.clipboardCheck, color: Colors.green),
          Container(width: 5),
          Text(
            "Verified",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green
            ),
          ),
        ],
      ),
    ) : Container();
  }
}