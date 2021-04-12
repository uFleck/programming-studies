import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _inputController = new TextEditingController();

  final _padding = EdgeInsets.all(20);
  var _names = [];

  void _addToNames(value) {
    setState(() {
      _names.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: _padding,
                    child: TextField(
                      controller: _inputController,
                      decoration: InputDecoration(hintText: 'Type something here!'),
                      onSubmitted: (value) {
                        _addToNames(value);
                      }
                    ),
                  ),
                ),
              ],
            ),
            
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        _addToNames(_inputController.text);
                        print('$_names');
                      },
                      child: Text('Send'),
                    ),
                  ),
                ),
              ],
            ),
            
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Center(
                      child: Text(() {
                        if (_names.isEmpty) {
                          return '';
                        } else {
                          return '$_names';
                        }
                      }(),
                        style: TextStyle(
                          fontSize: 20,
                        ),  
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _names.shuffle();
          });
        },
        tooltip: 'Shuffle',
        child: Icon(Icons.shuffle)
      ),
    );
  }
}