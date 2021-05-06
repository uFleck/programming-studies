import 'package:client_project/model/model.dart';
import 'package:client_project/view/view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String APP_ROUTE_HOME = "/home";
  static const String APP_ROUTE_CLIENT_REGISTER = "/clientRegister";
  static const String APP_ROUTE_CLIENTS = "/clients";
  static const String APP_ROUTE_ABOUT = "/about";

  Route getRoutes(RouteSettings routeSettings) {

    switch(routeSettings.name) {

      case APP_ROUTE_HOME: {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => MyHomePage(title: 'Home')
        );
      }

      case APP_ROUTE_CLIENT_REGISTER: {
        return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => ClientRegister(Client('', '')),
        );
      }

      case APP_ROUTE_CLIENTS: {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => Clients(),
        );
      }

      case APP_ROUTE_ABOUT: {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => About(),
        );
      }

      default: {
        return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => MyHomePage(title: 'Home'),
            fullscreenDialog: true
        );
      }

    }
  }

}