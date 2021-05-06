import 'package:client_final_project/model/model.dart';
import 'package:flutter/material.dart';

class ClientRegister extends StatefulWidget {

  final Client client;

  ClientRegister(this.client);

  @override
  _ClientRegisterState createState() => _ClientRegisterState();
}

class _ClientRegisterState extends State<ClientRegister> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  _rowName() {
    return TextField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: "Nome"),
    );
  }

  _rowEmail() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: "Email"),
    );
  }

  _rowRegister(BuildContext context) {
    return TextButton(
      onPressed: () {
        print('clicou registrar');

        widget.client.name = _nameController.text;
        widget.client.email = _emailController.text;

        print(widget.client.toString());

        Navigator.pop(context, widget.client);
      },
      child: Text('Registrar'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de cliente'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _rowName(),
            _rowEmail(),
            _rowRegister(context)
          ],
        ),
      ),
    );
  }
}
