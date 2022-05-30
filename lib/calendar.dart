// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:spotify/sportsinterest.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
  final ValueNotifier<DateTime?> longDateSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeSubShort = ValueNotifier(null);
  final TextEditingController meetingName = TextEditingController();
  final TextEditingController meetingLink = TextEditingController();

  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff272525),
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (interestedsports())));
            },
            child: Icon(Icons.arrow_back, color: Colors.white)),
        title: Text(
          "Calendar",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.month,

              calendarStyle: CalendarStyle(
                  todayColor: Colors.blue,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              // onDaySelected: (date, events) {
              //   print(date.toUtc());
              // },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 60,
                        child: Center(
                          child: TextField(
                            style: TextStyle(height: 1.0),
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(15)),
                              counterText: "",
                            ),
                            maxLength: 2,
                            controller: hourController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        height: 40,
                        width: 60,
                        child: Center(
                          child: TextField(
                            style: TextStyle(height: 1.0),
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(15)),
                              counterText: "",
                            ),
                            maxLength: 2,
                            controller: minuteController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(25),
                    child: TextButton(
                      child: const Text(
                        'Create alarm',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {
                        int hour;
                        int minutes;
                        hour = int.parse(hourController.text);
                        minutes = int.parse(minuteController.text);

                        // creating alarm after converting hour
                        // and minute into integer
                        FlutterAlarmClock.createAlarm(hour, minutes);
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FlutterAlarmClock.showAlarms();
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Text(
                        "Show Alarms",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      )),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // show alarm
                  //     FlutterAlarmClock.showAlarms();
                  //   },
                  //   child: const Text(
                  //     'Show Alarms',
                  //     style: TextStyle(fontSize: 20.0),
                  //   ),
                  // ),
                ],
              ),
            ),
          ])),
    );
  }
}
