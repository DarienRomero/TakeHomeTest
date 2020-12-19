part of 'commit_bloc.dart';

@immutable
abstract class CommitEvent {}

class OnSelectCommit extends CommitEvent {

  final GithubCommitsResponse commit;
  OnSelectCommit(this.commit);
}

class OnDeselectCommit extends CommitEvent {}