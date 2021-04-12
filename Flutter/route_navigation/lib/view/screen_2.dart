import 'package:flutter/material.dart';
import 'package:route_navigation/app/app.dart';
import 'package:route_navigation/app/app_routes.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: Screen2View(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}

class Screen2View extends StatefulWidget {
  @override
  _Screen2ViewState createState() => _Screen2ViewState();
}

class _Screen2ViewState extends State<Screen2View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen2'),
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