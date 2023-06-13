import 'package:flutter/material.dart';
//import 'screen/screen.dart';
import 'screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: ChatPage(),
      home: MyHomePage(),
    );
  }
}
