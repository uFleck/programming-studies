import 'package:client_project/database/database.dart';
import 'package:client_project/model/model.dart';
import 'package:flutter/material.dart';

class Clients extends StatefulWidget {
  @override
  _ClientsState createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  ClientHelper _helper = ClientHelper();

  List<Client> _clients = [];

  @override
  void initState() {
    super.initState();

    _helper.fetchAll().then((list) {
      print(list);
      setState(() {
        _clients = list;
      });
    });
  }

  _clientCard(BuildContext context, int index) {
    GestureDetector(
      onTap: () {
        print('apertou no cardzinho');
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_clients[index].name ?? '',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(_clients[index].cpf ?? '',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _list(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: _clients.length,
      itemBuilder: (context, index) {
        return _clientCard(context, index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clients'),),
      body: Column(
        children: [
          Expanded(child: _list(context),),
        ],
      ),
    );
  }
}