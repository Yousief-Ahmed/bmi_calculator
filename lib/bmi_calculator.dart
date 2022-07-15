import 'dart:ffi';
import 'dart:math';

import 'package:bmi_calculator/BmiResult.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double height =120;
  bool isMale =true;
  int weight=65;
  int Age= 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black12,
        ),
        toolbarHeight: 45,
        backgroundColor: Colors.black87,
        title: Center(
            child: Text(
              "BMI Calculator",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 15,
                  start: 10,
                  end: 10,
                  bottom: 10
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState((){
                            isMale=true;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Mars_symbol.svg/2000px-Mars_symbol.svg.png'),
                                height: 90,
                                width: 90,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:isMale? Colors.redAccent: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20 ,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState((){
                            isMale=false;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: NetworkImage("https://icon-library.com/images/female-icon/female-icon-28.jpg"),
                                height: 90,
                                width: 90,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: !isMale? Colors.redAccent: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ), //Gender part
          Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8.0,
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "${height.round()}",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        activeColor: Colors.white,
                          inactiveColor: Colors.grey,
                          thumbColor: Colors.red,
                          value: height,
                          max: 240,
                          min: 50,
                          onChanged: (value){
                           setState((){
                             height=value;
                           });
                          }),
                    ],

                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white70,
                  ),
                ),
              )
          ), //Height Part
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  bottom: 15,
                  start: 10,
                  end: 10,
                  top: 10
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${weight}',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text("kg"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState((){
                                  weight--;
                                });
                              },
                              mini: true,
                                  child:Icon(
                                Icons.remove,
                                    color: Colors.white,
                              ),
                                heroTag: "Weight -",
                              ),
                              FloatingActionButton(onPressed: (){
                                setState((){
                                  weight++;
                                });
                              },
                              mini: true,
                                  child:Icon(
                                Icons.add,
                                    color: Colors.white,
                              ),
                                heroTag: "Weight +",
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20 ,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$Age',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState((){
                                  Age--;
                                });
                              },
                                  heroTag: "Age -",
                                  mini: true,
                                  child:Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  )),
                              FloatingActionButton(onPressed: (){
                                setState((){
                                  Age++;
                                });
                              },
                                  heroTag: "Age +",
                                  mini: true,
                                  child:Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),

                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),//Age and Weight part
         Container(
           width: double.infinity,
           height: 50,
           decoration: BoxDecoration(
             color: Colors.red[700],
           ),
           child: MaterialButton(onPressed: (){
             double res=weight/pow(height/100, 2);
              print(res.round());
             Navigator.push(context,
               MaterialPageRoute(
               builder:(context) => BmiResult(
                 height: height.round(),
                 age: Age,
                 isMale: isMale,
                 result: res.round(),
                 weight: weight,
               ),
               ),
             );
           },
             child: Text(
               'Calculate',
               style: TextStyle(
                 fontSize: 25,
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
               ),
             ),
           ),
         )
        ],
      ),
    );
  }
}
