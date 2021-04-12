import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Three Tabs w/ images'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.alt_route),
                ),
                Tab(
                  icon: Icon(Icons.gps_off),
                ),
                Tab(
                  icon: Icon(Icons.fastfood),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Image.asset('images/luffy.jpg'),
              Image.asset('images/zoro.jpg'),
              Image.asset('images/sanji.jpg'),
            ],
          ),
        ));
  }
}
