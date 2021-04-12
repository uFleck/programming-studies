import 'package:flutter/material.dart';

import '../Model/person.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
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
      body: Center(
        child: Column(
          children: [
            Text('Press the button!', style: TextStyle(fontSize: 20.0),),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('Enviou Mensagem');
          final person = Person();
          person.name = "Bruno";
          person.lastName = "Koster";
          person.email = "bruno10762@gmail.com";
          person.age = 17;

          _showAlert('${person.toString()}', yesButton: 'Yes');
        },
        tooltip: '....',
        child: Icon(Icons.add),
      ),
    );
  }

  _showAlert(String message, {String title, String yesButton}) {
    AlertDialog alert = AlertDialog(
      title: Text(title ?? 'Person'),
      content: Text(message),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text(yesButton ?? 'Yes')),
      ],
    );

    showDialog(context: context, builder: (BuildContext context){
      return alert;
    });
  }
}