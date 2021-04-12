import 'package:flutter/material.dart';
import 'package:love_calculator/model/love_calculator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _secondNameController = TextEditingController();

  _form() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: _formUI(),
    );
  }

  _formUI() {
    return Column(
      children: [
        _firstName(),
        _secondName(),
        _button(),
      ],
    );
  }

  _firstName() {
    return TextFormField(
      controller: _firstNameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(hintText: 'Nome da primeira pessoa'),
      maxLength: 40,
      validator: (value) {
        if(value.length <= 2) {
          return 'Digite um nome válido!';
        } else {
          print('Nome bonito');
        }
        return null;
      },
    );
  }

  _secondName() {
    return TextFormField(
      controller: _secondNameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(hintText: 'Nome da segunda pessoa'),
      maxLength: 40,
      validator: (value) {
        if(value.length <= 2) {
          return 'Digite um nome válido!';
        } else {
          print('Nome fei');
        }
        return null;
      },
    );
  }

  _button() {
    return TextButton.icon(
      onPressed: () {
        _send();
        _resetFields();
      },
      label: Text('Enviar'),
      icon: Icon(Icons.add),
    );
  }

  _send() async {
    if(_formKey.currentState.validate()) {
      final loveCalculator = LoveCalculator(_firstNameController.text, _secondNameController.text);
      for(var i = 5; i > 0; i--) {
        await Future.delayed(Duration(seconds: 1), () {
          _snackBar('$i', 1);
        });
      }
      
      _snackBar(loveCalculator.generateLovePercent(), 3);
    } else {
      _snackBar('Dados Inválidos!', 3);
    }
  }

  _resetFields() => _formKey.currentState.reset();

  _snackBar(message, time) {
    return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message), duration: Duration(seconds: time),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: _form(),
        ),
      ),
    );
  }
}
