import 'package:flutter/material.dart';
import 'package:flutter_basckball/view/animal_show/a_animalContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(title: 'Text Demo'),
    );
  }
}