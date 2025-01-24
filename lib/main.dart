import 'package:assignment1/models/units_data.dart';
// import 'package:assignment1/pages/units.dart';
import 'package:assignment1/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Initials and Surname: M.Mamashela


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UnitsData(),
          builder: (context, child) {
            return const MaterialApp(
              initialRoute: RouteManager.homePage,
              onGenerateRoute: RouteManager.generateRoute,
            );
          },
        ),
      ],
    );
  }
}
