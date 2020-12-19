part of 'commit_bloc.dart';

@immutable
class CommitState {
  final bool commitActive;
  final GithubCommitsResponse commit;

  CommitState({
    this.commitActive = false,
    this.commit
  });
  CommitState copyWith({
    bool commitActive,
    GithubCommitsResponse commit,
  }) => CommitState(
    commitActive: commitActive ?? this.commitActive,
    commit    : commit ?? this.commit,
  );
}
