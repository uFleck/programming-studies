import 'package:client_project/app/app_routes.dart';
import 'package:client_project/database/database.dart';
import 'package:client_project/model/model.dart';
import 'package:client_project/view/view.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ClientHelper _helper = ClientHelper();
  List<Client> _clients = [];

  _save(BuildContext context) async {
    final client = await Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRegister(Client('', ''))));

    if(client != null) await _helper.save(client);
    setState(() async {
      _clients = await _helper.fetchAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TextButton.icon(
            icon: Icon(Icons.app_registration),
            label: Text('Register'),
            onPressed: () async {
              _save(context);
            }
          ),
          TextButton.icon(
            icon: Icon(Icons.people_alt_rounded),
            label: Text('Clients'),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.APP_ROUTE_CLIENTS);
            }
          ),
        ],
      )
    );
  }
}
