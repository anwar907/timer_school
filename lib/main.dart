
import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:clock/hari.dart';
import 'package:flutter/material.dart';
import 'package:clock/clock_body.dart';

void main() {
  
  runApp(MyApp());
  // const oneSec = const Duration(seconds:1);
  // new Timer.periodic(oneSec, (Timer t) => print('hi!'));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _clockTheme = _buildClockTheme(false);
  List<bool> isSelected = [false];
  List<bool> selected = [true, true, true];
  static AudioCache cache = AudioCache();
  AudioPlayer player;
  bool isPlaying = false;
  AudioCache _audioCache = AudioCache();
  Color _myColor = Colors.grey[350];
  Color _kColor = Colors.grey[350];
  Color _pColor = Colors.grey[350];
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(false, "Jam Masuk"));
    sampleData.add(new RadioModel(false, "Jam Keluar"));
    sampleData.add(new RadioModel(false, "Jam Pulang"));
    _audioCache = AudioCache(fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.LOOP));
  }

  void playerHandler1()async{
    if(isPlaying){
      player.stop();
    }else{
      player = await _audioCache.play('audio/1.mp3');
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void playerHandler2() async{
    if(isPlaying){
      player.stop();
    }else{
      player = await _audioCache.play('audio/2.mp3');
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void playerHandler3() async{
    if(isPlaying){
      player.stop();
    }else{
      player = await _audioCache.play('audio/3.mp3');
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }
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
                            
                        RaisedButton(
                          color: _myColor,
                          onPressed: () async{
                            playerHandler1();
                            setState(() {
                              if(_myColor == Colors.grey[600]){
                                _myColor = Colors.grey[350];
                              }else{
                                _myColor = Colors.grey[600];
                              }
                            });
                          },
                          child: Text("Jam Masuk"),
                        ),
                        RaisedButton(
                          color: _kColor,
                          onPressed: () async{
                            playerHandler2();
                            setState(() {
                              if(_kColor == Colors.grey[600]){
                                _kColor = Colors.grey[350];
                              }else{
                                _kColor = Colors.grey[600];
                              }
                            });
                          },
                          child: Text("Jam Istirahat"),
                        ),
                        RaisedButton(
                          color: _pColor,
                          onPressed: () async{
                            playerHandler3();
                            setState(() {
                              if(_pColor == Colors.grey[600]){
                                _pColor = Colors.grey[350];
                              }else{
                                _pColor = Colors.grey[600];
                              }
                            });
                          },
                          child: Text("Jam Pulang"),
                        )
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarDemo()));
                              },
                              child: Card(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Senin"),
                            ),
                          ),
                            ),
                          InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarDemo()));
                              },
                              child: Card(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Selasa"),
                            ),
                          ),
                            ),
                          InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarDemo()));
                              },
                              child: Card(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Rabu"),
                            ),
                          ),
                            ),
                          InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarDemo()));
                              },
                              child: Card(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Kamis"),
                            ),
                          ),
                            ),
                          InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarDemo()));
                              },
                              child: Card(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Jum'at"),
                            ),
                          ),
                            ),
                          InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarDemo()));
                              },
                              child: Card(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Sabtu"),
                            ),
                          ),
                            ),
                          ],
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Card(
                      //       child: Container(
                      //         padding: EdgeInsets.all(20),
                      //         child: Text("senin"),
                      //       ),
                      //     ),
                      //     Card(
                      //       child: Container(
                      //         padding: EdgeInsets.all(20),
                      //         child: Text("selasa"),
                      //       ),
                      //     ),
                      //     Card(
                      //       child: Container(
                      //         padding: EdgeInsets.all(20),
                      //         child: Text("rabu"),
                      //       ),
                      //     ),
                      //     Card(
                      //       child: Container(
                      //         padding: EdgeInsets.all(20),
                      //         child: Text("kamis"),
                      //       ),
                      //     ),
                      //     Card(
                      //       child: Container(
                      //         padding: EdgeInsets.all(20),
                      //         child: Text("jum'at"),
                      //       ),
                      //     ),
                      //     Card(
                      //       child: Container(
                      //         padding: EdgeInsets.all(20),
                      //         child: Text("sabtu"),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          ButtonBar(
                        children: [
                          new Builder(builder: (BuildContext context){
                            return RaisedButton(
                              color: Colors.grey,
                              elevation: 2,
                              onPressed: (){},
                              child: new Text("Start", style: TextStyle(color: Colors.white),),
                            );
                          })
                        ],
                      ),
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

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 50.0,
            width: 50.0,
            child: new Center(
              child: new Text(_item.buttonText,
                  style: new TextStyle(
                      color:
                          _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected
                  ? Colors.blueAccent
                  : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected
                      ? Colors.blueAccent
                      : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
          // new Container(
          //   margin: new EdgeInsets.only(left: 10.0),
          //   // child: new Text(_item.buttonText),
          // )
        ],
      ),
    );
  }
}


class RadioModel {
  bool isSelected;
  final String buttonText;
  

  RadioModel(this.isSelected, this.buttonText,);
}