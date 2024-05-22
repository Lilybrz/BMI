import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var heController = TextEditingController();
  var weController = TextEditingController();
  var backGroundColor = Colors.blueAccent.shade100;

  var result = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('BMI'),
        ),
        body: Container(
          color: backGroundColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    controller: weController,
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(207, 137, 192, 201),
                      label: Text('Enter your weight(kg)'),
                      prefixIcon: Icon(Icons.self_improvement_sharp),
                    ),
                  ),
                  SizedBox(height: 11),
                  TextField(
                    controller: heController,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(207, 137, 192, 201),
                      label: Text('Enter your height(m)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  SizedBox(height: 11),
                  ElevatedButton(
                      onPressed: () {
                        var wt = weController.text.toString();
                        var ht = heController.text.toString();

                        if (wt != '' && ht != '') {
                          var intWt = double.parse(wt);
                          var intHt = double.parse(ht);

                          var totalBmi = intWt / pow(intHt, 2);
                          var resultMassage = "";

                          if (totalBmi < 18) {
                            backGroundColor = Colors.orange.shade400;
                            resultMassage = "You are UnderWeight.";
                          } else if (totalBmi > 18 && totalBmi < 25) {
                            backGroundColor = Colors.green.shade600;
                            resultMassage = "Your weight is healthy.";
                           
                          } else {
                            backGroundColor = Colors.red.shade600;
                            resultMassage = "You are OverWeight.";
                          }

                          setState(() {
                            result =
                                '$resultMassage \n BMI is: ${totalBmi.toStringAsFixed(2)};';
                          });
                        } else {
                          setState(() {
                            result = "fill the required filled";
                          });
                        }
                      },
                      child: Text('Calculate')),
                  SizedBox(height: 11),
                  Text(
                    result,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
