import 'package:flutter/material.dart';
import 'package:route_navigation/app/app.dart';
import 'view/views.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage('Home'),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}

