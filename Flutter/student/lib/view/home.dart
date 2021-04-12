import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:student/model/student.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _grade1Controller = TextEditingController();
  TextEditingController _grade2Controller = TextEditingController();

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
        _rowName(),
        _rowLastName(),
        _rowGrade1(),
        _rowGrade2(),
        Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: _rowButton(),
        )
      ],
    );
  }

  _rowName() {
    return TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(hintText: 'First name'),
      maxLength: 20,
      validator: (value) {
        if (value.isNotEmpty && value.length >= 2) {
          print('Tudo certin');
        } else {
          return 'Type a valid name!';
        }
        return null;
      },
    );
  }

  _rowLastName() {
    return TextFormField(
      controller: _lastNameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(hintText: 'Last name'),
      maxLength: 20,
      validator: (value) {
        if (value.isNotEmpty && value.length >= 2) {
          print('Tudo certin');
        } else {
          return 'Type a valid last name!';
        }
        return null;
      },
    );
  }

  _rowGrade1() {
    return TextFormField(
      controller: _grade1Controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(hintText: 'First Grade'),
      validator: (value) {
        if (value.isNotEmpty) {
          print('Tudo certin');
        } else {
          return 'Type a valid grade!';
        }
        return null;
      },
    );
  }

  _rowGrade2() {
    return TextFormField(
      controller: _grade2Controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(hintText: 'Second Grade'),
      validator: (value) {
        if (value.isNotEmpty) {
          print('Tudo certin');
        } else {
          return 'Type a valid grade!';
        }
        return null;
      },
    );
  }

  _rowButton() {
    return TextButton.icon(
      onPressed: () {
        _send();
        _resetFields();
      },
      label: Text('Send'),
      icon: Icon(Icons.send),
    );
  }

  _send() {
    if (_formKey.currentState.validate()) {
      final student = Student(
          _nameController.text,
          _lastNameController.text,
          double.tryParse(_grade1Controller.text),
          double.tryParse(_grade2Controller.text));
      print(student.calculateAverage());
      _snackBar(student.toString());
    } else {
      print('vish...');
      _snackBar('Invalid data');
    }
  }

  _resetFields() => _formKey.currentState.reset();

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

  _snackBar(message) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/mihawk.jpg',
                width: 40.0,
                height: 50.0,
              ),
              tooltip: 'Mihawk',
              onPressed: () {
                _snackBar('Beautiful Character');
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Center(
              child: _flare(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: _form(),
            ),
          ],
        ));
  }
}
