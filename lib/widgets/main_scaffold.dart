import 'package:flutter/material.dart';
import 'drawer.dart';

class MainScaffold extends StatelessWidget {
  final bool? isDrawerVisible;
  final String title;
  final Widget body;

  const MainScaffold({
    Key? key,
    this.isDrawerVisible = false,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Add your onPressed logic here
            },
          ),
        ],
      ),
      drawer: isDrawerVisible! ? const AppDrawer() : null,
      body: body,
    );
  }
}
