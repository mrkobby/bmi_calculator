import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMI());

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI Calculator",
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xff090C22)),
        scaffoldBackgroundColor: Color(0xff090C22),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
      },
    );
  }
}

