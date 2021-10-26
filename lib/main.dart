import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'calculationPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://cutewallpaper.org/21/gym-backgrounds/Best-33-Exercise-Gym-Background-on-HipWallpaper-Exercise-.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: AvatarGlow(
                    endRadius: 150,
                    shape: BoxShape.circle,
                    glowColor: Colors.white,
                    duration: Duration(seconds: 3),
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 1),
                    showTwoGlows: true,
                    startDelay: Duration(seconds: 1),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Body.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Body Mass Index",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Calculator",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Calculation()));
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.black12;
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
