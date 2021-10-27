import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  Calculation({Key? key}) : super(key: key);

  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  bool ismale = true;
  bool mpressed = false;
  bool fpressed=false;
  double? result;
  void Result() {
    setState(() {
      double h = double.parse(height.text);
      double w = double.parse(weight.text);
      result = w / (h * h);
      print(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.grey[850]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               
                IconButton(
                    onPressed: () {
                      setState(() {
                        fpressed=!fpressed;
                      });
                    },
                    icon: Icon(
                      Icons.female_outlined,
                      size: 50,
                      color: fpressed ? Colors.white:Colors.blueAccent
                      
                    )
                    ),
                     IconButton(
                    onPressed: () {
                      setState(() {
                        mpressed=!mpressed;
                      });
                    },
                    icon: Icon(
                      Icons.male_outlined,
                      size: 50,
                      color: mpressed ? Colors.white:Colors.blueAccent
                      
                    )
                    )
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
          ElevatedButton(
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
                shadowColor: MaterialStateProperty.all(Colors.white)),
          )
        ],
      ),
    ));
  }
}
