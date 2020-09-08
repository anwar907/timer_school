
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:clock/clock_body.dart';

void main() {
  
  runApp(MyApp());
  const oneSec = const Duration(seconds:1);
  new Timer.periodic(oneSec, (Timer t) => print('hi!'));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _clockTheme = _buildClockTheme(false);
  List<bool> isSelected = [false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _clockTheme,
      home: Scaffold(
          backgroundColor: isSelected[0] ? Colors.grey[800] : Colors.grey[300],
          body: Center(
            child: OrientationBuilder(
              builder: (context, orientation) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(    //Flex is basically row and column combined into one
                    //Change axis based on orientation of screen
                    // direction: orientation == Orientation.portrait
                    // ? Axis.vertical : Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget> [
                        RaisedButton(onPressed: (){},
                        child: Text("Jam Masuk"),),
                        RaisedButton(onPressed: (){},
                        child: Text("Jam Istirahat"),),
                        RaisedButton(onPressed: (){},
                        child: Text("Jam Pulang"),)
                      ],),
                      ),
                      Container(height: 200, width: 300, child: Clock()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.all(20),
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10), color: Colors.black54),
                      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                        Text(
                          '00',
                          style: TextStyle(
                              color: Colors.white, fontSize: 54, fontWeight: FontWeight.bold),
                        ),
                        Text('Jam',
                            style: TextStyle(
                              color: Colors.white,
                            ))
                      ])),
                      Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.all(20),
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10), color: Colors.black54),
                      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                        Text(
                          '00',
                          style: TextStyle(
                              color: Colors.white, fontSize: 54, fontWeight: FontWeight.bold),
                        ),
                        Text('Min',
                            style: TextStyle(
                              color: Colors.white,
                            ))
                      ])),
                      Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.all(20),
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10), color: Colors.black54),
                      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                        Text(
                          '00',
                          style: TextStyle(
                              color: Colors.white, fontSize: 54, fontWeight: FontWeight.bold),
                        ),
                        Text('Sec',
                            style: TextStyle(
                              color: Colors.white,
                            ))
                      ])),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [
                          ButtonBar(
                        children: [
                          new Builder(builder: (BuildContext context){
                            return RaisedButton(
                              elevation: 2,
                              onPressed: (){},
                              child: new Icon(Icons.add)
                            );
                          })
                        ],
                      ),
                      Expanded(child: ButtonBar(
                        children: [
                          new Builder(builder: (BuildContext context){
                            return RaisedButton(
                              elevation: 2,
                              onPressed: (){},
                              child: new Text("Start"),
                            );
                          })
                        ],
                      ),)
                        ],
                      )
                      
                      // Material(
                      //   child: ToggleButtons(
                      //     color: Colors.grey[800],
                      //     selectedColor: Colors.grey[300],
                      //     fillColor: Colors.grey[800],
                      //     borderColor: Colors.black,
                      //     selectedBorderColor: Colors.white,
                      //     children: <Widget>[
                      //       Icon(Icons.brightness_3),
                      //     ],
                      //     onPressed: (int index) {
                      //       setState(() {
                      //         isSelected[index] = !isSelected[index];
                      //         _clockTheme = _buildClockTheme(isSelected[index]);
                      //       });
                      //     },5554555555
                      //     isSelected: isSelected,
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ClockBody(),
      );
  }
}

ThemeData _buildClockTheme(bool darkMode) {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: darkMode ? Colors.grey[800] : Colors.white,
    colorScheme: darkMode
        ? base.colorScheme.copyWith(
            primary: Colors.grey[800],
            secondary: Colors.grey[900],
            secondaryVariant: Colors.grey[700],
            primaryVariant: Colors.white,
    )
        : base.colorScheme.copyWith(
            primary: Colors.grey[300],
            secondary: Colors.grey[500],
            secondaryVariant: Colors.white,
            primaryVariant: Colors.grey,
          ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

        class TimerPage extends StatefulWidget {
          @override
          _TimerPageState createState() => _TimerPageState();
        }

        class _TimerPageState extends State<TimerPage> {
          bool running = false;
          @override
          Widget build(BuildContext context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // TikTikTimer(
                    //   initialDate: DateTime.now(),
                    //   running: running,
                    //   height: 150,
                    //   width: 150,
                    //   backgroundColor: Colors.indigo,
                    //   timerTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                    //   borderRadius: 100,
                    //   isRaised: true,
                    //   tracetime: (time) {
                    //     // print(time.getCurrentSecond);
                    //   },
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          child: Text(
                            'Start',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.green,
                          onPressed: () {
                            try {
                              if (running == false)
                                setState(() {
                                  running = true;
                                });
                            } on Exception {}
                          },
                        ),
                        RaisedButton(
                          child: Text(
                            'Stop',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.red,
                          onPressed: () {
                            if (running == true)
                              setState(() {
                                running = false;
                              });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        }