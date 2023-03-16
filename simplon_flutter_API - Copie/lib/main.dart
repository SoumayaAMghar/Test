import 'package:flutter/material.dart';
import 'package:myapp/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'models/NavItem.dart';

void main() {
  runApp( MyApp());
}
MaterialColor simplonColor = const MaterialColor(
  0xFFCE0033, // Primary color value
  <int, Color>{
    50: Color.fromRGBO(206, 0, 51, 0.1),
    100: Color.fromRGBO(206, 0, 51, 0.2),
    200: Color.fromRGBO(206, 0, 51, 0.3),
    300: Color.fromRGBO(206, 0, 51, 0.4),
    400: Color.fromRGBO(206, 0, 51, 0.5),
    500: Color.fromRGBO(206, 0, 51, 0.6),
    600: Color.fromRGBO(206, 0, 51, 0.7),
    700: Color.fromRGBO(206, 0, 51, 0.8),
    800: Color.fromRGBO(206, 0, 51, 0.9),
    900: Color.fromRGBO(206, 0, 51, 1.0),
  },
);
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipe App',
        theme: ThemeData(
          primarySwatch: simplonColor,

        ),
        home: HomeScreen(),
      ),
    );
  }
}
