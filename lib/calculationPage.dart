import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculation extends StatefulWidget {
  Calculation({Key? key}) : super(key: key);

  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();

  double result = 0.0;
  String status = "Body Status..";
  void Result() {
    setState(() {
      double h = double.parse(height.text);
      double w = double.parse(weight.text);
      result = w / (h * h);
      print(result);

      if (result < 18.5) {
        status = "Underweight :/";
      } else if (result >= 18.5 && result <= 24.9) {
        status = "Healthy :)";
      } else if (result >= 25.0 && result <= 29.9)
        status = "Overweight :(";
      else {
        status = "Obese ;(";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(color: Colors.grey[900]),
              child: Column(
          children: [
            AppBar(
              title: Center(
                child: Text(
                  "BMI Calculator",
                  
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              backgroundColor: Color(0xFFF4F2F2FF),
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: Color(0x00CE0A0A)),
              shadowColor: Colors.white,
              elevation: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // IconButton(
                  //     onPressed: () {
                  //       setState(() {
        
                  //          mpressed = !mpressed;
                  //         ismale = false;
                  //       });
                  //     },
                  //     icon: Icon(Icons.female_outlined,
                  //         size: 50,
                  //         color: fpressed ? Colors.white : Colors.blueAccent)),
                  // IconButton(
                  //     onPressed: () {
                  //       setState(() {
        
                  //          fpressed = !fpressed;
                  //         ismale = true;
                  //       });
                  //     },
                  //     icon: Icon(Icons.male_outlined,
                  //         size: 50,
                  //         color: mpressed ? Colors.white : Colors.blueAccent))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Height(in m)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              hintText: "Enter height..",
                            ),
                            keyboardType: TextInputType.number,
                            controller: height,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Weight(in kg)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                hintText: "Enter weight.."),
                            keyboardType: TextInputType.number,
                            controller: weight,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
              child: ElevatedButton(
                onPressed: () {
                  Result();
                },
                child: Text('Calculate',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.black12;
                      return null; // Defer to the widget's default.
                    },
                  ),
                  shadowColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Text(result.toStringAsFixed(2),
                      style: TextStyle(color: Colors.indigo[300], fontSize: 35)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text(status,
                          style:
                              TextStyle(color: Colors.indigo[700], fontSize: 35,fontWeight: FontWeight.bold))),
                ],
              ),
            )
          ],
              ),
            ),
        ));
  }
}
