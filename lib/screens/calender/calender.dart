import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class HomeCalendarPage extends StatefulWidget {
  @override
  _HomeCalendarPageState createState() => _HomeCalendarPageState();
}
class _HomeCalendarPageState extends State<HomeCalendarPage> {

  late CalendarController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calendar Example'),
      ),
      body:

      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.orange,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events,e) {
                           print(date.toUtc());
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            )
          ],
        ),
      ),





      // SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: <Widget>[
      //       TableCalendar(
      //         initialCalendarFormat: CalendarFormat.month,
      //         calendarStyle: CalendarStyle(
      //             todayColor: Colors.blue,
      //             selectedColor: Theme.of(context).primaryColor,
      //             todayStyle: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 22.0,
      //                 color: Colors.white)
      //         ),
      //         headerStyle: HeaderStyle(
      //           centerHeaderTitle: true,
      //           formatButtonDecoration: BoxDecoration(
      //             color: Colors.brown,
      //             borderRadius: BorderRadius.circular(22.0),
      //           ),
      //           formatButtonTextStyle: TextStyle(color: Colors.white),
      //           formatButtonShowsNext: false,
      //         ),
      //         startingDayOfWeek: StartingDayOfWeek.monday,
      //         onDaySelected: (date, events,e) {
      //           print(date.toUtc());
      //         },
      //         builders: CalendarBuilders(
      //           selectedBuilder: (context, date, events) => Container(
      //               margin: const EdgeInsets.all(5.0),
      //               alignment: Alignment.center,
      //               decoration: BoxDecoration(
      //                   color: Theme.of(context).primaryColor,
      //                   borderRadius: BorderRadius.circular(8.0)),
      //               child: Text(
      //                 date.day.toString(),
      //                 style: TextStyle(color: Colors.white),
      //               )),
      //           todayBuilder: (context, date, events) => Container(
      //               margin: const EdgeInsets.all(5.0),
      //               alignment: Alignment.center,
      //               decoration: BoxDecoration(
      //                   color: Colors.blue,
      //                   borderRadius: BorderRadius.circular(8.0)),
      //               child: Text(
      //                 date.day.toString(),
      //                 style: TextStyle(color: Colors.white),
      //               )),
      //         ),
      //         calendarController: _controller,
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}