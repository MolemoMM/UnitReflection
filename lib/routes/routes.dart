import 'package:assignment1/pages/choice_page.dart';

import 'package:assignment1/pages/units.dart';
import 'package:flutter/material.dart';
// import 'package:matcher/matcher.dart';

// Initials and Surname: M.Mamashela


class RouteManager {
  static const String homePage = '/';

  static const String choice = '/choicePage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const Units(),
        );

      case choice:
        return MaterialPageRoute(builder: (context) => const Choice());

      default:
        throw const FormatException('Page not found');
    }
  }
}
