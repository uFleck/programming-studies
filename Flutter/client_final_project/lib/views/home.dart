import 'package:client_final_project/db/db.dart';
import 'package:client_final_project/model/model.dart';
import 'package:client_final_project/views/views.dart';
import 'package:client_final_project/translate/translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ClientHelper _helper = ClientHelper();
  FlutterTts _flutterTts = FlutterTts();
  List<Client> _clients = [];

  @override
  void initState() {
    super.initState();

    _greetings();

    _helper.fetchAll().then((list) {
      print(list);
      setState(() {
        _clients = list ?? Client('', '');
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _flutterTts.stop();
  }

  _save(BuildContext context) async {
   final client = await Navigator.push(context, MaterialPageRoute(builder: (context) => ClientRegister(Client('',''))));

   if(client != null)
     await _helper.save(client);
   setState(() async {
     _clients = await _helper.fetchAll();
   });
  }

  _clientCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print(_clients[index].toString());
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_clients[index].name ?? "",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(_clients[index].email ?? "",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _list(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: _clients.length ?? 0,
      itemBuilder: (context, index) {
        return _clientCard(context, index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).translate('title')),),
      body: Column(
        children: [
          Expanded(child: _list(context),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _save(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  _greetings() async {
    await _flutterTts.setVolume(1);
    return await _flutterTts.speak(AppLocalizations.of(context).translate('greetings'));
  }
}
