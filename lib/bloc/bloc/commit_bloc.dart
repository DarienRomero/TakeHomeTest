import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:take_home_test/models/git_commits_response.dart';

part 'commit_event.dart';
part 'commit_state.dart';

class CommitBloc extends Bloc<CommitEvent, CommitState> {
  CommitBloc() : super(CommitState());
  @override
  Stream<CommitState> mapEventToState(CommitEvent event,) async* {
    if ( event is OnSelectCommit ) {
      yield state.copyWith( commitActive: true, commit: event.commit );
    } else if ( event is OnDeselectCommit ) {
      yield state.copyWith( commitActive: false );
    }
  }
}
