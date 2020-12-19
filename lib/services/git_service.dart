import 'package:take_home_test/models/git_commits_response.dart';
import 'package:http/http.dart' as http;

class GitService{
  GitService._privateConstructor();
  static final GitService _intance = GitService._privateConstructor();
  factory GitService() => _intance;
  //Change this token with yours
  String _githubCommitsUrl = 'https://api.github.com/repos/DarienRomero/TakeHomeTest/commits';
  String _token  = '8ceaaf53edeea8055bd2ca7d3d568da5b287605e';

  Future<List<GithubCommitsResponse>> getCommitsHistory() async {

    try {
      final resp = await http.get(_githubCommitsUrl, headers: {'Authorization': 'token ${this._token}'});
      if(resp.statusCode == 200){
        final githubCommitsResponse = githubCommitsResponseFromJson(resp.body);
        return githubCommitsResponse;
      }else{
        return null;
      }
      
    } catch (e) {
      return null;
    }

  }
}