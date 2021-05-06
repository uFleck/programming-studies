import 'package:flutter/material.dart';
import '../bloc/bloc.dart';

class AndroidHome extends StatefulWidget {

  final String title;

  const AndroidHome({Key key, this.title}) : super(key: key);

  @override
  _AndroidHomeState createState() => _AndroidHomeState();
}

class _AndroidHomeState extends State<AndroidHome> {
  var imcBloc = IMCBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: ListView(
        children: [
          _rowHeight(),
          _rowWeight(),
          _rowResult(),
          _rowCalculateButton(),
          _rowResetButton()
        ],
      ),
    );
  }

  _rowHeight() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Altura (m)"
        ),
        controller: imcBloc.heightController,
        keyboardType: TextInputType.number,
      ),
    );
  }
  _rowWeight() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Peso (kg)"
        ),
        controller: imcBloc.weightController,
        keyboardType: TextInputType.number,
      ),
    );
  }

  _rowResult() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: StreamBuilder<String>(
        stream: imcBloc.myStream,
        initialData: "",
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Text('Deu erro!');
          } else if(snapshot.hasData) {
            return Text('Resultado: ${snapshot.data}');
          }
          return Text('');
        },
      )
    );
  }

  _rowCalculateButton() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextButton(
        child: Text('Calcular'),
        onPressed: () => imcBloc.calculate(),
      )
    );
  }

  _rowResetButton() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextButton(
        child: Text('Limpar Campos'),
        onPressed: () => imcBloc.resetFields(),
      )
    );
  }
}