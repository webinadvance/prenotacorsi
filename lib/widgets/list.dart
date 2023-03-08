import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'auth_widget.dart';
import 'main_scaffold.dart';

class MyListWidget extends StatefulWidget {
  @override
  _MyListWidgetState createState() => _MyListWidgetState();
}

class _MyListWidgetState extends State<MyListWidget> {
  List<dynamic> _data = [];

/*  Future<List<dynamic>> _fetchData() async {
    final response = await http.get(Uri.parse(
        "https://localhost:5001/api/tocorsi?club=836191a6-7e03-4ce9-a981-fe0eeba646f6&day=2023-03-07T21%3A52%3A24%2B01%3A00&week=10&mine=false"));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData); // print the JSON data to the console
      return jsonData;
    } else {
      throw Exception('Failed to load data');
    }
  }*/

  Future<List<dynamic>> _fetchData() async {
    final String jsonData = await rootBundle.loadString('data/tocorsi.json');
    final List<dynamic> data = json.decode(jsonData);
    return data;
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
        title: "list",
        body: Material(
          child: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Theme.of(context).splashColor,
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
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                _data[index]['trainer'],
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 24.0),
                        child: Text(
                          _data[index]['ORARIO'],
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
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
