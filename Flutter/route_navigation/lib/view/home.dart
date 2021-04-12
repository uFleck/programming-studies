import 'package:flutter/material.dart';
import 'package:route_navigation/app/app_routes.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(String s, {Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Homezinha')  
          ),
          TextButton.icon(
            icon: Icon(Icons.add), 
            label: Text('Tela 1'),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.APP_ROUTE_SCREEN_1);
            }, 
          ),
          TextButton.icon(
            icon: Icon(Icons.add), 
            label: Text('Tela 2'),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.APP_ROUTE_SCREEN_2);
            }, 
          ),
        ],
      )
    );
  }
}
