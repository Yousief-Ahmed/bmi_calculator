import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BmiResult extends StatelessWidget {
  final int result;
  final isMale ;
  final int age ;
  final int weight;
  final int height;

  BmiResult({
  required this.height,
  @required this.isMale,
  required this.age,
  required this.weight,
  required this.result,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black12,
        ),
        backgroundColor: Colors.black87,
        toolbarHeight: 45,
        centerTitle: true,
        title: Text(
          'Result',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Gender :${ isMale?' Male': ' Female' }",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            Text(
              "Age : $age",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "Weight : $weight",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  width:2,
                ),
                Text("kg",
                style: TextStyle(
                  color: Colors.white
                ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "Height : $height",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  width:2,
                ),
                Text("cm",
                style: TextStyle(
                  color: Colors.white,
                ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "BMI : $result",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// Text('m',
// style: TextStyle(
// color: Colors.white,
// ),),