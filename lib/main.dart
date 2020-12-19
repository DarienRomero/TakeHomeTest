import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_test/bloc/bloc/commit_bloc.dart';
import 'package:take_home_test/pages/principal_page.dart';
 
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CommitBloc() )
      ],
      child: MaterialApp(
        title: 'Take Home Test',
        debugShowCheckedModeBanner: false,
        home: PrincipalPage()
      ),
    );
  }
}