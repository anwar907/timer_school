import 'dart:convert';
import 'dart:ffi';

import 'package:bel_sekolah3/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TabBarDemo extends StatefulWidget {
  List<Map> listJadwal;
  String hari;
  TabBarDemo({this.listJadwal, this.hari});
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  String waktu;
  List waktu1;
  List waktufix;
  String dropDownValue = "Bel Masuk";
  get date => DateTime.now();
  String hari;

  Map jadwal = {'jam': "", 'bel': ""};
  List<Map> listJadwal;
  List<Map<Map, dynamic>> listmap;
  Map harijadwal = {"Monday" : {'jam': "", 'bel': ""}};


  //List<Map> listmapjadwal = [];
  

//   _simpan() async {
//   // List<Map> daftarJadwal = [listJadwal.last];
//   // daftarJadwal.add(listJadwal.last);
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //List<Map> _text = listJadwal;
  
//   var listjadwalString = json.encode(listmapjadwal);
//   await prefs.setString('text_tersimpan', listjadwalString);
// }

// _panggil() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var _ambiltext = prefs.getString('text_tersimpan');
//   List listtext = jsonDecode(_ambiltext);
//   for(var i in listtext){
//     Map z = i;
//     listmapjadwal.add(z);
//   }

//   print(listmapjadwal);
// }

// _panggillast() async {

//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var _ambiltext = prefs.getString('text_tersimpan');
//    List listtext = jsonDecode(_ambiltext);
//    Map z = listtext.last;
//    listmapjadwal.add(z);
//   // for(var i in listtext){
//   //   Map z = i;
//   //   listmapjadwal.add(z);
//   // }


// }

  void _editButtonSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 30,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Center(
                        child: Text("Add"),
                      ),
                      Spacer(),
                      IconButton(
                          padding: EdgeInsets.only(left: 30),
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Pilih Waktu"),
                      FlatButton(
                        onPressed: () {
                          DatePicker.showTimePicker(context,
                              showTitleActions: true, onChanged: (date) {
                            print('change $date in time zone ' +
                                date.timeZoneOffset.inHours.toString());
                            waktu = date.toString();
                            waktu1 = waktu.split(" ");
                            waktufix = waktu1[1].split(".");
                          }, onConfirm: (date) {
                            print('confirm $date');
                          }, currentTime: DateTime.now());
                        },
                        child: ListTile(
                          leading: Icon(Icons.timer),
                          title: Text("waktu disini"),
                          trailing: Icon(Icons.add),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.list),
                        title: Text("pilih muncul disini"),
                        trailing: DropdownButton<String>(
                          value: dropDownValue,
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
                              dropDownValue = newValue;
                            });
                          },
                          items: <String>[
                            'Bel Masuk',
                            'Bel Istirahat',
                            'Bel Pulang'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      FlatButton(
                        onPressed: () async {
                          setState(() {
                            jadwal = {hari : {"jam": waktufix[0], "bel": dropDownValue}};      
                          });
                          
                          //print(listJadwal);
                          listJadwal.add(jadwal);
                          print(listJadwal);
                          
                          // print(listJadwal);
                          // _simpan();
                          // _panggillast();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Berhasil",
                                  style: TextStyle(fontSize: 12),
                                ),
                              );
                            },
                          );
                        },
                        child: Text("Set"),
                        color: Colors.grey,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

@override
  void initState() {
    // TODO: implement initState
    print(widget.listJadwal);
    listJadwal = widget.listJadwal;
    hari = widget.hari;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.grey[800],
              title: Center(
                child: Text('Set Time'),
              )),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.grey,
              onPressed: () {
                // print(listJadwal.length);
                // print(listJadwal.first.isEmpty);
                _editButtonSheet(context);
              }),
          body: Container(
            child: Column(
              children: [
                (listJadwal == null) ? 
                Container()
                : 
                ListView.builder(
                        shrinkWrap: true,
                        itemCount: listJadwal.length,
                        itemBuilder: (_, index) {
                          return (listJadwal[index][hari] == null) ? Container() 
                          : Card(
                            child: Dismissible(
                              background: Container(color: Colors.red),
                              key: Key(listJadwal[index][hari].toString()),
                              onDismissed: (direction) {
                                listJadwal.removeAt(index);
                                //_simpan();
                              },
                              child: ListTile(
                                  leading: Text(listJadwal[index][hari]['jam']),
                                  trailing:
                                      Text(listJadwal[index][hari]['bel'])),
                            ),
                          );
                        }),
                        Center(
                          child: RaisedButton(
                            child: Text("Simpan"),
                            onPressed: (){
                              //harijadwal = {jadwal };
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(listJadwal: listJadwal,)));
                          }),
                        )
              ],
            ),
          ),
                  
        ),
      ),
    );
  }
}
