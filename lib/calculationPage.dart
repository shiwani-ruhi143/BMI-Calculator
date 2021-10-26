import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  Calculation({Key? key}) : super(key: key);

  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.grey[900],
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'data',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                  )
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
