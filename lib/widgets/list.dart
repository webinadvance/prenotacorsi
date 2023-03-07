import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyListWidget extends StatefulWidget {
  @override
  _MyListWidgetState createState() => _MyListWidgetState();
}

class _MyListWidgetState extends State<MyListWidget> {
  List<dynamic> _data = [];

  Future<List<dynamic>> _fetchData() async {
    final response = await http.get(Uri.parse("https://localhost:5001/api/tocorsi?club=836191a6-7e03-4ce9-a981-fe0eeba646f6&day=2023-03-07T21%3A52%3A24%2B01%3A00&week=10&mine=false"));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData); // print the JSON data to the console
      return jsonData;
    } else {
      throw Exception('Failed to load data');
    }
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
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_data[index]['trainer']),
          subtitle: Text(_data[index]['club_name']),
        );
      },
    );
  }
}
