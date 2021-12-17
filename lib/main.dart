import 'package:cinema_ticket/core/route/generate_route.dart';
import 'package:cinema_ticket/core/route/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: routeInit,
      onGenerateRoute: generateRoute,
    );
  }
}