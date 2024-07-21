import 'package:flutter/material.dart';
import 'package:mobilev2/src/presentation/views/unathenticated/auth_checker.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const AuthChecker(), settings);

      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => view, settings: settings);
  }
}