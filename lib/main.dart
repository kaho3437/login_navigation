import 'package:flutter/material.dart';
import 'package:login_navigation/app_model.dart';
import 'package:provider/provider.dart';
import 'package:login_navigation/first_screen.dart';
import 'package:login_navigation/second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppModel(),
      child: MaterialApp(
        title: 'Navigation Demo',
        routes: {
          FirstScreen.routeName: (context) => FirstScreen(),
          SecondScreen.routeName: (context) => SecondScreen(),
        },
      ),
    );
  }
}
