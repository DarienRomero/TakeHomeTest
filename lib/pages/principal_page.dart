import 'package:flutter/material.dart';
import 'package:take_home_test/models/git_commits_response.dart';
import 'package:take_home_test/services/git_service.dart';
import 'package:take_home_test/widgets/commits_list.dart';
import 'package:take_home_test/widgets/commits_list_skeleton.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  GitService gitService = new GitService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Git commits history"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: (){
          setState(() {});
          return Future.value(null);
        },
        child: FutureBuilder<List<GithubCommitsResponse>>(
          future: gitService.getCommitsHistory(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: return CommitsListSkeleton();
              case ConnectionState.none: return CommitsListSkeleton();
              case ConnectionState.active: return CommitsList(snapshot.data);
              case ConnectionState.done: return CommitsList(snapshot.data);
            }
            return CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}
