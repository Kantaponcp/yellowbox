import 'package:flutter/material.dart';
import 'package:yellowbox/assets/color.dart';
import 'package:yellowbox/pages/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CollectionsColors.orange,
        accentColor: CollectionsColors.orange,
        backgroundColor: CollectionsColors.background,
        scaffoldBackgroundColor: CollectionsColors.background,
        fontFamily: 'Mitr',
      ),
      home: LoginPage(),
    );
  }
}

