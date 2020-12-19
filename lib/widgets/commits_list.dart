import 'package:flutter/material.dart';

import 'package:take_home_test/data/commits.dart';
import 'package:take_home_test/widgets/branch_code.dart';
import 'package:take_home_test/widgets/commit_verified.dart';
import 'package:take_home_test/widgets/user_photo.dart';
class CommitsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: commits.length,
      itemBuilder: (BuildContext context, int index){
        return Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserPhoto(commits[index].autorAvatarUrl),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(commits[index].message),
                      Container(height: 10),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: commits[index].autorName, style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' commited '),
                            TextSpan(text: commits[index].date),
                          ],
                        ),
                      ),
                      Container(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BranchCode(commits[index].code),
                          Container(width: 40),
                          CommitVerified(commits[index].verified)
                        ],
                      )
                    ],
                  ),
                  Container(height: 10),
                ],
              ),
              Divider()
            ],
          ),
        );
      }
    );
  }
}