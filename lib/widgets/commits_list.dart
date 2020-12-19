import 'package:flutter/material.dart';
import 'package:take_home_test/bloc/bloc/commit_bloc.dart';
import 'package:take_home_test/helpers/helpers.dart';

import 'package:take_home_test/models/git_commits_response.dart';
import 'package:take_home_test/pages/commit_page.dart';
import 'package:take_home_test/widgets/branch_code.dart';
import 'package:take_home_test/widgets/commit_verified.dart';
import 'package:take_home_test/widgets/user_photo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommitsList extends StatefulWidget {
  final List<GithubCommitsResponse> commits;
  CommitsList(this.commits);

  @override
  _CommitsListState createState() => _CommitsListState();
}

class _CommitsListState extends State<CommitsList> {
  @override
  Widget build(BuildContext context) {
    return (widget.commits != null) ? ListView.builder(
        itemCount: widget.commits.length,
        itemBuilder: (BuildContext context, int index){
          final commit = widget.commits[index];
          return GestureDetector(
            onTap: (){
              context.read<CommitBloc>().add( OnSelectCommit(commit));
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=>CommitPage())
              );
              
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserPhoto(commit.committer.avatarUrl, 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                commit.commit.message,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ),
                          ),
                          Container(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            child: SingleChildScrollView(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: commit.commit.author.name, style: TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' commited '),
                                    TextSpan(text: compareDates(commit.commit.author.date)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BranchCode(commit.sha.substring(0, 8)),
                              Container(width: 40),
                              CommitVerified(commit.commit.verification.verified)
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
            ),
          );
        }
      ):Center(child: Text("Ha ocurrido un error"));
  }
}