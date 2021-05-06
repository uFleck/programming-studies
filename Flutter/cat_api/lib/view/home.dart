import 'package:cat_api/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _catController = TextEditingController();

  // _form(CatBloc catBloc, BuildContext context) {
  //   return Column(
  //     children: [
  //       DropdownButton(
  //         items: ,
  //       ),
  //     ],
  //   );
  // }

  _form(CatBloc catBloc, BuildContext context) {
    return Column(
      children: [
        Text('Procure o CEP'),
        TextFormField(
          controller: _catController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            enabledBorder: OutlineInputBorder(),
            hintText: "Cat",
            hintStyle: TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.blue,
                style: BorderStyle.solid
              )
            )
          ),
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
            onPressed: () {
              print("clicou: ${_catController.text}");
              catBloc.add(FetchCatEvent(_catController.text));
            },
            child: Text('Buscar Gato')
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final catBloc = BlocProvider.of<CatBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<CatBloc, CatState>(
          builder: (context, state) {
            if(state is CatIsNotSearchedState) {
              return _form(catBloc, context);
            } else if(state is CatIsLoadingState) {
              return CircularProgressIndicator();
            } else if(state is CatIsLoadedState) {
              return Text('${state.props[0].toString()}');
            } else if(state is CatIsNotLoadedState) {
              return Text('Erro: ${state.getMessage.toString()}');
            }
            return Text('Erro!');
          },
        )
      ],
    );
  }
}