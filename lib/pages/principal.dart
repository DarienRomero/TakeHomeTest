import 'package:flutter/material.dart';
import 'package:take_home_test/widgets/commits_list.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Git commits history"),
        centerTitle: true,
      ),
      body: CommitsList()
    );
  }
}
