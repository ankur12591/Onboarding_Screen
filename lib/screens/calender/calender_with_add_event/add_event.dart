import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';

import 'models/app_event.dart';

class AddEventPage extends StatefulWidget {
  // final DateTime selectedDate;
  // final AppEvent event;

  // const AddEventPage({ required this.selectedDate, required this.event, })
  //    ;
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  late CalendarController _controller;
  late Map<DateTime, List<dynamic>> _events;
  late List<dynamic> _selectedEvents;
  late TextEditingController _eventController;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
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

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.bottomCenter,
      // margin: EdgeInsets.only(top: 100),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.clear,
              //  color: AppColors.primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFF36A9C))),
                onPressed: () async {
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
                    prefs.setString("events", json.encode(encodeMap(_events)));
                    _eventController.clear();
                    Navigator.pop(context);
                  });
                },
                child: Text(
                  "Save",
                ),
              ),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            //add event form
            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  // FormBuilderTextField(
                  //   controller: _eventController,
                  //   name: "title",
                  // //  initialValue: widget.event?.title,
                  //   decoration: InputDecoration(
                  //       hintText: "Add Title",
                  //
                  //       border: InputBorder.none,
                  //       focusedBorder: InputBorder. none,
                  //       enabledBorder: InputBorder. none,
                  //       errorBorder: InputBorder. none,
                  //       contentPadding: const EdgeInsets.only(left: 48.0)),
                  // ),
                  Divider(),
                  FormBuilderTextField(
                    controller: _eventController,
                    name: "description",
                    //  initialValue: widget.event?.description,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        hintText: "Add Details",
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.short_text)),
                  ),
                  Divider(),
                  // Container(
                  //  // color: Colors.blueGrey,
                  //  // padding: EdgeInsets.only(left: 5),
                  //   child: FormBuilderSwitch(
                  //     name: "public",
                  //     initialValue: false,
                  //     title: Text("Public"),
                  //     controlAffinity: ListTileControlAffinity.leading,
                  //     decoration: InputDecoration(
                  //       contentPadding: EdgeInsets.all(8),
                  //       border: InputBorder.none,
                  //       focusedBorder: InputBorder. none,
                  //       enabledBorder: InputBorder. none,
                  //       errorBorder: InputBorder. none,
                  //     ),
                  //   ),
                  // ),
                  Divider(),
                  // FormBuilderDateTimePicker(
                  //   name: "date",
                  //   initialValue:
                  //       DateTime.now(),
                  //   initialDate: DateTime.now(),
                  //   fieldHintText: "Add Date",
                  //   initialDatePickerMode: DatePickerMode.day,
                  //   inputType: InputType.date,
                  //   format: DateFormat('EEEE, dd MMMM, yyyy'),
                  //   decoration: InputDecoration(
                  //     contentPadding: EdgeInsets.all(8),
                  //     border: InputBorder.none,
                  //     focusedBorder: InputBorder. none,
                  //     enabledBorder: InputBorder. none,
                  //     errorBorder: InputBorder. none,
                  //     prefixIcon: Icon(Icons.calendar_today_sharp),
                  //   ),
                  // ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
