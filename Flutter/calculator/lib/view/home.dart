import 'package:calculator/model/calculator.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _number1Controller = new TextEditingController();
  TextEditingController _number2Controller = new TextEditingController();

  _rowNumber1() {
    return new TextFormField(
      controller: _number1Controller,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(hintText: 'Type the first number'),
      maxLength: 4,
      validator: (value) {
        if (value.isEmpty) {
          return 'Type a valid number!';
        }
        return null;
      },
    );
  }

  _rowNumber2() {
    return new TextFormField(
      controller: _number2Controller,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(hintText: 'Type the second number'),
      maxLength: 4,
      validator: (value) {
        if (value.isEmpty) {
          return 'Type a valid number!';
        }
        return null;
      },
    );
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        _send(context);
        _resetFields();
      },
      label: Text('Send'),
      icon: Icon(Icons.send),
    );
  }

  _formUI(BuildContext context) {
    return Column(
      children: [
        _rowNumber1(),
        _rowNumber2(),
        _rowButton(context),
      ],
    );
  }

  _rowForm(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: _formUI(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _rowForm(context),
            ],
          ),
        ),
      ),
    );
  }

  _send(BuildContext context) {
    if (_formKey.currentState.validate()) {
      final calculator = Calculator(double.tryParse(_number1Controller.text),
          double.tryParse(_number2Controller.text));
      print(calculator.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Result: ${calculator.toString()}'),
        duration: Duration(seconds: 10),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Fill in correctly!'),
        duration: Duration(seconds: 10),
      ));
    }
  }

  _resetFields() => _formKey.currentState.reset();
}
