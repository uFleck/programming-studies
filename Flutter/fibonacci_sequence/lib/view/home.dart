import 'package:flutter/material.dart';

import '../model/fibonacci.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _max = new TextEditingController();
  var fibonacci = Fibonacci();
  int _maxStream = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _max,
              keyboardType: TextInputType.numberWithOptions(decimal: false),
              decoration: InputDecoration(hintText: 'Max'),
              onFieldSubmitted: (value) {
                setState(() {
                  _maxStream = int.tryParse(value);
                });
              },
            ),
            TextButton.icon(
              label: Text("Fibonacci"),
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _maxStream = int.tryParse(_max.text);
                });
              }
            ),
            SizedBox(
              height: 300,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder(
                  stream: fibonacci.calculateSequence(_maxStream),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) {
                      print('entrou no stream');
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error'),
                      );
                    }

                    return Column(
                      children: [
                        Text('Fibonacci: ${snapshot.data}', style: TextStyle(fontSize: 30)),
                        Text('${fibonacci.sums}', style: TextStyle(fontSize: 30, color: Colors.grey)),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}