import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:route_navigation/view/views.dart';

class AppRoutes {
  static const String APP_ROUTE_HOME = '/home';
  static const String APP_ROUTE_SCREEN_1 = '/screen1';
  static const String APP_ROUTE_SCREEN_2 = '/screen2';
  static const String APP_ROUTE_ABOUT = '/about';

  Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case APP_ROUTE_SCREEN_1: {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => Screen1()
        );
      }
      case APP_ROUTE_SCREEN_2: {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => Screen2()
        );
      }
      case APP_ROUTE_ABOUT: {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => About()
        );
      }

      default: {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => MyHomePage('Navegação com rotas'),
          fullscreenDialog: true
        );
      }
    }
  }
}