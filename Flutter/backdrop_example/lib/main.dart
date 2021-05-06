// import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // _backLayer() {
  //   return 
  // }

  // _frontLayer() {
  //   return
  // }

  // _subHeader() {
  //   return BackdropSubHeader(
  //     title: Text("Subtitulo..."),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Text("a");
  //   return BackdropScaffold(
  //     appBar: BackdropAppBar(
  //       title: Text(widget.title),
  //       actions: [
  //         BackdropToggleButton(
  //           icon: AnimatedIcons.ellipsis_search,
  //         )
  //       ],
  //     ),
  //     // backLayer: _backLayer(),
  //     // frontLayer: _frontLayer(),
  //     subHeader: _subHeader(),
  //   );
  }
}
