import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// DateTime now = DateTime.now();
// String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.grey[800],
              // bottom: TabBar(
              //   tabs: [
              //     Tab(icon: Icon(Icons.access_time),text:"Set Clock" ,),
              //     Tab(icon: Icon(Icons.access_alarm),text: "History",),
              //   ],
              // ),
              title: Center(
                child: Text('Set Time'),
              )),
          body: TabBarView(
            children: [
              Column(
                children: [
                  // FlatButton(
                  //     onPressed: () {
                  //       DatePicker.showDatePicker(context,
                  //           showTitleActions: true,
                  //           minTime: DateTime(2018, 3, 5),
                  //           maxTime: DateTime(2030, 6, 7),
                  //           theme: DatePickerTheme(
                  //               headerColor: Colors.white,
                  //               backgroundColor: Colors.white,
                  //               itemStyle: TextStyle(
                  //                   color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  //               doneStyle: TextStyle(color: Colors.black, fontSize: 16)),
                  //           onChanged: (date) {
                  //         print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                  //       }, onConfirm: (date) {
                  //         print('confirm $date');
                  //       }, currentTime: DateTime.now(), locale: LocaleType.en);
                  //     },
                  //     child: Card(
                  //       child: ListTile(
                  //         leading: Text("SET DATE"),
                  //         trailing: Icon(Icons.add),
                  //       ),
                  //     )),
                  //     FlatButton(
                  //     onPressed: () {
                  //       DatePicker.showTimePicker(context, showTitleActions: true, onChanged: (date) {
                  //         print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                  //       }, onConfirm: (date) {
                  //         print('confirm $date');
                  //       }, currentTime: DateTime.now());
                  //     },
                  Card(
                    child: ListTile(
                      leading: Text("SET TIME"),
                      trailing: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              ListView.builder(itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.access_alarm),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
