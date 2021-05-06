import 'package:bloc_conceitual/platform/platform.dart';
import 'package:flutter/cupertino.dart';

class IOSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "IMC iOS",
      debugShowCheckedModeBanner: false,
      home: IOSHome(title: "IMC iOS"),
    );
  }
}