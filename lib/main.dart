import 'package:flutter/material.dart';
import 'package:flutter_basckball/view/animal_show/a_animalContainer.dart';
import 'package:flutter_basckball/view/animal_show/b_animatedcrossfade.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() => runApp(MyApp());
//我是分支路线


//我是主分支内容。
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: AnimalCrossFadePage(title: 'Text Demo'),
    );
  }
}