import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:prova_tabs/model/number.dart';
import 'package:prova_tabs/model/rectangle.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _lengthController = TextEditingController();
  TextEditingController _widthController = TextEditingController();
  var number = Number();
  var randomizedNumber = 0;

  _firstTab() {
    return Center(
      child: Stack(
        children: [
          _flare(),
          Text('Bruno Koster\nbruno10762@gmail.com'),
        ],
      ),
    );
  }

  _secondTab(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () {
          setState(() {
            randomizedNumber = number.generateRandomNumber();
            _snackBar('$randomizedNumber', 250);
          });
        },
        label: Text('Randomize'),
        icon: Icon(Icons.shuffle_outlined)
      ),
    );
  }

  _thirdTab() {
    return _form();
  }

  _form() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: _formUI(),
    );
  }

  _formUI() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          _lengthInput(),
          _widthInput(),
          _button(),
        ],
      ),
    );
  }

  _lengthInput() {
    return TextFormField(
      controller: _lengthController,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(hintText: 'Length'),
      validator: (value) {
        if (value.isNotEmpty) {
          print('Tudo certin');
        } else {
          return 'Type a valid length!';
        }
        return null;
      },
    );
  }

  _widthInput() {
    return TextFormField(
      controller: _widthController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(hintText: 'Width'),
      validator: (value) {
        if (value.isNotEmpty) {
          print('Tudo certin');
        } else {
          return 'Type a valid width!';
        }
        return null;
      },
    );
  }

  _button() {
    return TextButton.icon(
      label: Text("Send"),
      icon: Icon(Icons.send),
      onPressed: (){
        _send();
        _resetFields();
      },
    );
  }

  _resetFields() => _formKey.currentState.reset();

  _send() {
    if (_formKey.currentState.validate()) {
      final rectangle = Rectangle(double.tryParse(_widthController.text), double.tryParse(_lengthController.text));
      print(rectangle.calculateArea());
      print(rectangle.calculatePerimeter());
      _snackBar('Area: ${rectangle.calculateArea()}\nPerimeter: ${rectangle.calculatePerimeter()}', 4000);
    } else {
      print('vish...');
      _snackBar('Invalid data', 2000);
    }
  }

  _flare() {
    return Container(
      child: FlareActor(
        'assets/WorldSpin.flr',
        fit: BoxFit.contain,
        animation: 'roll',
      ),
      width: 300,
      height: 300,
    );
  }

  _snackBar(message, milliseconds) {
    return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message), duration: Duration(milliseconds: milliseconds),));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Three Tabs'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.email_outlined),
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
            _firstTab(),
            _secondTab(context),
            _thirdTab(),
          ],
        ),
      )
    );
  }
}
