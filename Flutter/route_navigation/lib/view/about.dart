import 'package:flutter/material.dart';
import 'package:route_navigation/app/app.dart';
import 'package:route_navigation/app/app_routes.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: AboutView(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
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