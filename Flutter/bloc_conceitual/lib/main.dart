// import 'dart:io';

import 'package:flutter/material.dart';

import 'platform/platform.dart';

// void main() => Platform.isIOS ? runApp(IOSApp()) : runApp(AndroidApp()); 
// não funciona quando roda pela web...
void main() {
  // print("IOS: ${Platform.isIOS}");
  // print("Android: ${Platform.isAndroid}");
  // print("Linux: ${Platform.isLinux}");
  // print("Windows: ${Platform.isWindows}");
  // print("Fuchsia: ${Platform.isFuchsia}");
  // print("MacOS: ${Platform.isMacOS}");
  runApp(AndroidApp());
}