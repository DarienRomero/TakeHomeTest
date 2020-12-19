import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BranchCode extends StatelessWidget {
  final String code;
  
  BranchCode(
    this.code
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 10,
        right: 10
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.blue[100]
      ),
      child: Row(
        children: [
          Icon(FontAwesomeIcons.gitAlt, color: Colors.blue),
          Container(width: 5),
          Text(
            code,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue
            ),
          ),
        ],
      ),
    );
  }
}