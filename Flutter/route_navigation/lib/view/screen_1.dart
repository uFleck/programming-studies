import 'package:flutter/material.dart';
import 'package:route_navigation/app/app.dart';
import 'package:route_navigation/app/app_routes.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: Screen1View(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}

class Screen1View extends StatefulWidget {
  @override
  _Screen1ViewState createState() => _Screen1ViewState();
}

class _Screen1ViewState extends State<Screen1View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen1'),
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Center(
            child: TextButton.icon(
              icon: Icon(Icons.arrow_back_ios),
              label: Text('Home'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.APP_ROUTE_HOME);
              },
            ),
          ),
        ],
      ),
    );
  }
}