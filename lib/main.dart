import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bel_sekolah3/jadwal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clock_body.dart';
import 'hari.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final List<Map> listJadwal;
  final String hari;

  MyApp({this.listJadwal, this.hari});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Jadwal list;
  ThemeData _clockTheme = _buildClockTheme(false);
  Color mycolor = Colors.grey[350];
  List<bool> isSelected = [false];
  List<bool> selected = [true, true, true];
  AudioPlayer player;
  bool isPlaying = false;
  AudioCache _audioCache = AudioCache();
  AudioCache _bunyi = AudioCache();
  Color _myColor = Colors.grey[350];
  Color _kColor = Colors.grey[350];
  Color _pColor = Colors.grey[350];
  List<RadioModel> sampleData = new List<RadioModel>();
  static var now = DateTime.now();
  var tanggal = "";

  var jam = '';
  var hari = '';
  String dropdownValue = 'Bel Masuk';

  List<Map> listJadwal = [];
  List<Map<Map, dynamic>> listmap;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(false, "Jam Masuk"));
    sampleData.add(new RadioModel(false, "Jam Keluar"));
    sampleData.add(new RadioModel(false, "Jam Pulang"));
    _audioCache = AudioCache(
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.LOOP));
    _bunyi = AudioCache(
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
    startJam();

    //belbunyiotomatis();
    if (widget.listJadwal == null) {
      listJadwal = [];
    } else {
      listJadwal = widget.listJadwal;
    }
  }

  void startJam() {
    Timer.periodic(new Duration(seconds: 1), (_) {
      var tgl = new DateTime.now();
      var formatedjam = new DateFormat.Hms().format(tgl);
      var formatedTanggal = new DateFormat.yMMMEd().format(tgl);
      var day = new DateFormat.E().format(tgl);

      setState(() {
        jam = formatedjam;
        tanggal = formatedTanggal;
        hari = day;
      });
      belbunyiotomatis();
    });
  }

  void belbunyi() async {
    if (isPlaying) {
      player.stop();
    } else {
      if (dropdownValue == "Bel Masuk") {
        player = await _audioCache.play('audio/3.mp3');
      } else if (dropdownValue == "Bel Istirahat") {
        player = await _audioCache.play('audio/2.mp3');
      } else if (dropdownValue == "Bel Pulang") {
        player = await _audioCache.play('audio/1.mp3');
      }
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void belbunyiotomatis() async {
    for (var i in listJadwal) {
      if (hari == "Mon") {
        if (jam == i['Mon']['jam']) {
          if (i['Mon']['bel'] == "Bel Masuk") {
            player = await _bunyi.play('audio/3.mp3');
          } else if (i['Mon']['bel'] == "Bel Istirahat") {
            player = await _bunyi.play('audio/2.mp3');
          } else if (i['Mon']['bel'] == "Bel Pulang") {
            player = await _bunyi.play('audio/1.mp3');
          }
        }
      } else if (hari == "Tue") {
        if (jam == i['Tue']['jam']) {
          if (i['Tue']['bel'] == "Bel Masuk") {
            player = await _bunyi.play('audio/3.mp3');
          } else if (i['Tue']['bel'] == "Bel Istirahat") {
            player = await _bunyi.play('audio/2.mp3');
          } else if (i['Tue']['bel'] == "Bel Pulang") {
            player = await _bunyi.play('audio/1.mp3');
          }
        }
      } else if (hari == "Wed") {
        if (jam == i['Wed']['jam']) {
          if (i['Wed']['bel'] == "Bel Masuk") {
            player = await _bunyi.play('audio/3.mp3');
          } else if (i['Wed']['bel'] == "Bel Istirahat") {
            player = await _bunyi.play('audio/2.mp3');
          } else if (i['Wed']['bel'] == "Bel Pulang") {
            player = await _bunyi.play('audio/1.mp3');
          }
        }
      } else if (hari == "Thu") {
        if (jam == i['Thu']['jam']) {
          if (i['Thu']['bel'] == "Bel Masuk") {
            player = await _bunyi.play('audio/3.mp3');
          } else if (i['Thu']['bel'] == "Bel Istirahat") {
            player = await _bunyi.play('audio/2.mp3');
          } else if (i['Thu']['bel'] == "Bel Pulang") {
            player = await _bunyi.play('audio/1.mp3');
          }
        }
      } else if (hari == "Fri") {
        if (jam == i['Fri']['jam']) {
          if (i['Fri']['bel'] == "Bel Masuk") {
            player = await _bunyi.play('audio/3.mp3');
          } else if (i['Fri']['bel'] == "Bel Istirahat") {
            player = await _bunyi.play('audio/2.mp3');
          } else if (i['Fri']['bel'] == "Bel Pulang") {
            player = await _bunyi.play('audio/1.mp3');
          }
        }
      } else if (hari == "Sat") {
        if (jam == i['Sat']['jam']) {
          if (i['Sat']['bel'] == "Bel Masuk") {
            player = await _bunyi.play('audio/3.mp3');
          } else if (i['Sat']['bel'] == "Bel Istirahat") {
            player = await _bunyi.play('audio/2.mp3');
          } else if (i['Sat']['bel'] == "Bel Pulang") {
            player = await _bunyi.play('audio/1.mp3');
          }
        }
      }
    }
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            DropdownButton<String>(
                              value: dropdownValue,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (String newValue) async {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                                if (isPlaying) {
                                  if (dropdownValue == "Bel Masuk") {
                                    player =
                                        await _audioCache.play('audio/3.mp3');
                                  } else if (dropdownValue == "Bel Istirahat") {
                                    player =
                                        await _audioCache.play('audio/2.mp3');
                                  } else if (dropdownValue == "Bel Pulang") {
                                    player =
                                        await _audioCache.play('audio/1.mp3');
                                  }
                                }
                              },
                              items: <String>[
                                'Bel Masuk',
                                'Bel Istirahat',
                                'Bel Pulang'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            SizedBox(width: 10),
                            RaisedButton(
                                color: mycolor,
                                child: Text("Bel Bunyi"),
                                onPressed: () {
                                  belbunyi();
                                  setState(() {
                                    if (mycolor == Colors.grey[350]) {
                                      mycolor = Colors.grey[600];
                                    } else {
                                      mycolor = Colors.grey[350];
                                    }
                                  });
                                })
                          ],
                        ),
                      ),
                      Container(height: 200, width: 300, child: Clock()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.all(20),
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(10),
                                  color: Colors.black54),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      tanggal,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      jam,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ])),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TabBarDemo(
                                            hari: "Mon",
                                            listJadwal: listJadwal)));
                              },
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text("Senin"),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TabBarDemo(
                                            hari: "Tue",
                                            listJadwal: listJadwal)));
                              },
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text("Selasa"),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TabBarDemo(
                                            hari: "Wed",
                                            listJadwal: listJadwal)));
                              },
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text("Rabu"),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TabBarDemo(
                                            hari: "Thu",
                                            listJadwal: listJadwal)));
                              },
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text("Kamis"),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TabBarDemo(
                                            hari: "Fri",
                                            listJadwal: listJadwal)));
                              },
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text("Jum'at"),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TabBarDemo(
                                            hari: "Sat",
                                            listJadwal: listJadwal)));
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
                      color: _item.isSelected ? Colors.white : Colors.black,
                      fontSize: 18.0)),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Colors.blueAccent : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(
    this.isSelected,
    this.buttonText,
  );
}
