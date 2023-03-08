import 'package:flutter/material.dart';

import 'main_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: "prenotacorsi.com",
      isDrawerVisible: true,
      body: Center(
        child: ElevatedButton(
          child: Text("list"),
          onPressed: () {
            Navigator.pushNamed(context, '/list');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .secondary,
          ),
        ),
      ),
    );
  }
}
