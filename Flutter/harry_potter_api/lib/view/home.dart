import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _house;

  _apiButton() {
    return TextButton(
      onPressed: () async {
        final url = Uri.https('www.potterapi.com', '/v1/sortingHat');
        var response = await http.get(url);

        if(response.statusCode == 200) {
          var jsonResponse = convert.jsonDecode(response.body);
          setState(() {
            _house = jsonResponse;
            _warning();
          });
        } else {
          _snackBar('Erro!');
        }         
      }, 
      child: Text('Randomizar Casa', style: TextStyle(fontSize: 20)),
    );
  }

  _warning() {
    if(_house != null) {
      switch(_house) {
        case 'Gryffindor': {
          return 'Leãozinho do Proerd';
        }
        case 'Slytherin': {
          return 'Cobra do Adão e Eva lá';
        }
        case 'Hufflepuff': {
          return 'Texugo fofo';
        }
        case 'Ravenclaw': {
          return 'Águia bolada';
        }
      }
    } else {
      return 'Sem casas ainda...';
    }
  }

  // _displayHouse() {
  //   if(_house != null) {
  //     return '$_house';
  //   } else {
  //     return '';
  //   }
  // }

  _displayHouse() => _house != null ? '$_house' : '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset('images/${_displayHouse().toString().toLowerCase()}.png'),  
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(_displayHouse(), style: TextStyle(fontSize: 20),),
                Text(_warning(), style: TextStyle(fontSize: 20),),
                _apiButton(),
              ],
            ),
          ),
        ],
      )
    );
  }

  _snackBar(message) {
    return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
  }
}
