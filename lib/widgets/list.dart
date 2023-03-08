import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'auth_widget.dart';
import 'main_scaffold.dart';

import 'package:intl/intl.dart';

class MyListWidget extends StatefulWidget {
  @override
  _MyListWidgetState createState() => _MyListWidgetState();
}

class _MyListWidgetState extends State<MyListWidget> {
  List<dynamic> _data = [];

  Future<List<dynamic>> _fetchData() async {
    final String jsonData = await rootBundle.loadString('data/tocorsi.json');
    final List<dynamic> data = json.decode(jsonData);
    return data;
  }

  DateTime getDateTime(int year, int weekNumber, int dayOfWeek) {
    // Calculate the first day of the given year
    DateTime firstDayOfYear = DateTime(year, 1, 1);

    // Calculate the day of the week of the first day of the year (0 = Monday, 6 = Sunday)
    int firstDayOfWeek = firstDayOfYear.weekday;

    // Calculate the number of days between the first day of the year and the first day of the week
    int offset = (dayOfWeek - firstDayOfWeek + 7) % 7;

    // Calculate the date of the first day of the given week
    DateTime firstDayOfWeekDate =
        firstDayOfYear.add(Duration(days: offset + (weekNumber - 1) * 7));

    return firstDayOfWeekDate;
  }

  @override
  void initState() {
    super.initState();
    _fetchData().then((data) {
      setState(() {
        _data = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticatedWidget(
      child: MainScaffold(
        title: "Lista",
        body: Material(
          child: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) {
              int dayOfWeek = _data[index]['giorno'];
              String timestamp = _data[index]['ora'];
              int weekNumber = _data[index]['week'];
              int year = DateTime.now().year;
              DateTime dateTime = getDateTime(year, weekNumber, dayOfWeek);
              List<String> timeParts = timestamp.split(':');
              int hour = int.parse(timeParts[0]);
              int minute = int.parse(timeParts[1]);
              int second = int.parse(timeParts[2]);
              dateTime = dateTime
                  .add(Duration(hours: hour, minutes: minute, seconds: second));

              return Container(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Material(
                    //color: Theme.of(context).colorScheme.background,
                    elevation: 4.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _data[index]['corso'],
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  _data[index]['trainer'],
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 24.0),
                          child: Text(
                            DateFormat('y MMMM dd H:mm').format(dateTime),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
