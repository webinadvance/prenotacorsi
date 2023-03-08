import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final String title; // new named parameter for the title
  const MainScaffold({required this.body, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // use the title parameter here
      ),
      drawer: const AppDrawer(),
      body: body,
    );
  }
}
