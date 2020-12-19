import 'package:meta/meta.dart';

class GitCustomResponse {

  final bool ok;
  final String msg;

  GitCustomResponse({
    @required this.ok, 
    this.msg
  });


}