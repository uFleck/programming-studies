import 'package:client_project/model/model.dart';
import 'package:flutter/material.dart';

class ClientRegister extends StatefulWidget {

  final Client client;

  ClientRegister(this.client);

  @override
  _ClientRegisterState createState() => _ClientRegisterState();
}

class _ClientRegisterState extends State<ClientRegister> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();

  _name() {
    return new TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.name,
      decoration: new InputDecoration(hintText: 'Type your name'),
      maxLength: 20,
      validator: (value) {
        if (value.isEmpty) {
          return 'Type a valid name!';
        }
        return null;
      },
    );
  }

  _cpf() {
    return new TextFormField(
      controller: _cpfController,
      keyboardType: TextInputType.name,
      decoration: new InputDecoration(hintText: 'Type your CPF'),
      maxLength: 20,
      validator: (value) {
        if (value.isEmpty) {
          return 'Type a valid CPF!';
        }
        return null;
      },
    );
  }

  _button(BuildContext context) {
    return TextButton.icon(
      onPressed: () {

        widget.client.name = _nameController.text;
        widget.client.cpf = _cpfController.text;

        print(widget.client.toString());

        Navigator.pop(context, widget.client);
      },
      label: Text('Send'),
      icon: Icon(Icons.send),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _name(),
            _cpf(),
            _button(context),
          ],
        ),
      ),
    );
  }
}