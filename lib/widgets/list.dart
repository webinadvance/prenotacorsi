import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prenotacorsi/widgets/main_scaffold.dart';

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
    DateTime firstDayOfYear = DateTime(year, 1, 1);
    int firstDayOfWeek = firstDayOfYear.weekday;
    int offset = (dayOfWeek - firstDayOfWeek + 7) % 7;
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

  final List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  final List<int> numbers = [1, 2, 3];

  List<Tab> myTabs = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 1; i <= 7; i++) {
      myTabs.add(
        Tab(
          icon: Icon(Icons.directions_transit),
          text: "Item $i",
        ),
      );
    }

    print(myTabs);

    return MainScaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 7,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                onTap: (p0) {
                  print(p0);
                },
                backgroundColor: Colors.red,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: myTabs,
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: Icon(Icons.directions_car),
                    ),
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),
                    Center(
                      child: Icon(Icons.directions_bike),
                    ),
                    Center(
                      child: Icon(Icons.directions_car),
                    ),
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),
                    Center(
                      child: Icon(Icons.directions_bike),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      title: 'corsi',
    );
  }
}
