import 'package:cat_api/bloc/bloc.dart';
import 'package:cat_api/service/cat_service.dart';
import 'package:cat_api/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cat BLoC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Cats!'),),
        body: BlocProvider(
          lazy: false,
          create: (context) => CatBloc(CatService()),
          child: MyHomePage(title: 'Cats!',),
        ),
      )
    );
  }
}
