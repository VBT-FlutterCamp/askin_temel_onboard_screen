import 'package:flutter/material.dart';
import 'package:covid_app/feature/onboard/view/onboard_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID-19 Onboard Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color.fromRGBO(32, 178, 161,1),
      ),
      home: OnBoardScreen(),
    );
  }
}