import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:prenotacorsi/store.dart';
import 'package:prenotacorsi/widgets/data_table.dart';
import 'package:prenotacorsi/widgets/list.dart';
import 'package:prenotacorsi/widgets/login_page.dart';
import 'package:redux/redux.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

final ThemeData theme = ThemeData();

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
/*        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
              primary: Colors.deepPurple, secondary: Colors.orange),
        ),*/
        home: DataTableScreen(),
        routes: {
          '/login': (context) => LoginPage(),
          '/list': (context) => MyListWidget(),
          '/datatable': (context) => DataTableScreen(),
        },
      ),
    );
  }
}
