import 'package:flutter/material.dart';

class DummyData {
  final int id;
  final String name;
  final int age;
  final String email;

  DummyData({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
  });
}

class DataTableScreen extends StatefulWidget {
  @override
  _DataTableScreenState createState() => _DataTableScreenState();
}

class _DataTableScreenState extends State<DataTableScreen> {
  List<DummyData> _dummyDataList = [
    DummyData(id: 1, name: 'John Doe', age: 30, email: 'john.doe@example.com'),
    DummyData(id: 2, name: 'Jane Doe', age: 28, email: 'jane.doe@example.com'),
    DummyData(
        id: 3, name: 'Bob Smith', age: 35, email: 'bob.smith@example.com'),
    DummyData(
        id: 4,
        name: 'Alice Johnson',
        age: 25,
        email: 'alice.johnson@example.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy Data Table'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: FittedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Age')),
                      DataColumn(label: Text('Email')),
                    ],
                    rows: _dummyDataList
                        .map(
                          (data) => DataRow(
                            cells: [
                              DataCell(Text(data.id.toString())),
                              DataCell(Text(data.name)),
                              DataCell(Text(data.age.toString())),
                              DataCell(Text(data.email)),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
