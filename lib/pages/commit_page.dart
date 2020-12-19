import 'package:flutter/material.dart';
import 'package:take_home_test/bloc/bloc/commit_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_test/helpers/helpers.dart';
import 'package:take_home_test/widgets/user_photo.dart';

class CommitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final commit = context.watch<CommitBloc>().state.commit;
    return Scaffold(
      appBar: AppBar(
        title: Text("Commits details"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            context.read<CommitBloc>().add( OnDeselectCommit());
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Creator information", style: TextStyle(fontWeight: FontWeight.bold)),
            Container(height: 10),
            Center(
              child: UserPhoto(commit.committer.avatarUrl, 100),
            ),
            Container(height: 10),
            Text("Name: ${commit.commit.author.name}"),
            Container(height: 10),
            Text("Email: ${commit.commit.author.email}"),
            Divider(),
            Text("Commit information", style: TextStyle(fontWeight: FontWeight.bold)),
            Container(height: 10),
            Text("Message: ${commit.commit.message}"),
            Container(height: 10),
            Text("Identifier: ${commit.sha}"),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          mostrarAlerta(
            context, 
            "¿Ver detalles?", 
            "Se abrirá en el navegador",
            () async {
              await launchURL(commit.htmlUrl);
              Navigator.pop(context);
            }
          );
        }, 
        label: Text("   View in browser   "),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}