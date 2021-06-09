import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
      ScrollController(); //To Track Scroll of ListView

  late CalendarController _controller;
  late Map<DateTime, List<dynamic>> _events;
  late List<dynamic> _selectedEvents;
  late TextEditingController _eventController;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    // _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    prefsData();
  }

  prefsData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  var todayDateIs = "12";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //  backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        automaticallyImplyLeading: false,
        title: Text(
          'My Calendar',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              //To Show Current Date
              Container(
                  height: 30,
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    selectedDate.day.toString() +
                        '-' +
                        listOfMonths[selectedDate.month - 1] +
                        ', ' +
                        selectedDate.year.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.blueGrey),
                  )),
              SizedBox(height: 10),
              //To show Calendar Widget

              Container(
                  height: 80,
                  child: Container(
                      child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 15);
                    },
                    itemCount: 365,
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            currentDateSelectedIndex = index;
                            scrollController =
                                _eventController as ScrollController;
                            _selectedEvents = _events as List;
                            selectedDate =
                                DateTime.now().add(Duration(days: index));
                          });
                        },
                        child: Container(
                          height: 80,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(2, 2),
                                    blurRadius: 2)
                              ],
                              color: currentDateSelectedIndex == index
                                  ? Colors.orangeAccent
                                  : Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(
                              //   listOfMonths[DateTime.now()
                              //       .add(Duration(days: index))
                              //       .month -
                              //       1]
                              //       .toString(),
                              //   style: TextStyle(
                              //       fontSize: 16,
                              //       color: currentDateSelectedIndex == index
                              //           ? Colors.white
                              //           : Colors.grey),
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              Text(
                                DateTime.now()
                                    .add(Duration(days: index))
                                    .day
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: currentDateSelectedIndex == index
                                        ? Colors.white
                                        : Colors.blueGrey),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                listOfDays[DateTime.now()
                                            .add(Duration(days: index))
                                            .weekday -
                                        1]
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: currentDateSelectedIndex == index
                                        ? Colors.white
                                        : Colors.blueGrey),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ))),
              SizedBox(
                height: 20,
              ),

              ..._selectedEvents.map((event) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      child: Center(
                          child: Text(
                        event,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                    ),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    ));
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.white70,
              title: Text("Add Events"),
              content: TextField(
                controller: _eventController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (_eventController.text.isEmpty) return;
                    setState(() {
                      if (_events[_controller.selectedDay] != null) {
                        _events[_controller.selectedDay]!
                            .add(_eventController.text);
                      } else {
                        _events[_controller.selectedDay] = [
                          _eventController.text
                        ];
                      }
                      prefs.setString(
                          "events", json.encode(encodeMap(_events)));
                      _eventController.clear();
                      Navigator.pop(context);
                    });
                  },
                )
              ],
            ));
  }
}
