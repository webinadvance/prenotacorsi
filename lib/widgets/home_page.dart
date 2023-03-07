import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Login2"),
          onPressed: () {
            //Navigator.pushNamed(context, '/login');
            Navigator.pushNamed(context, '/datatable');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
