import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TabBarDemo extends StatelessWidget {
  get date => DateTime.now();

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
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String newValue) async {},
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
                        onPressed: () {
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
  Widget build(BuildContext context) {
// DateTime now = DateTime.now();
// String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
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
                _editButtonSheet(context);
              }),
          body: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Text("SET TIME"),
                    trailing: Icon(Icons.add),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
