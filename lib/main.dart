import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:prenotacorsi/store.dart';
import 'package:prenotacorsi/widgets/home_page.dart';
import 'package:prenotacorsi/widgets/list.dart';
import 'package:prenotacorsi/widgets/login_page.dart';
import 'package:redux/redux.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting('it_IT', null);
  Intl.defaultLocale = 'it_IT';
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
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.deepOrange, secondary: Colors.black),
        ),
        home: const HomePage(),
        routes: {
          '/login': (context) => LoginPage(),
          '/list': (context) => MyListWidget(),
          '/datatable': (context) => HomePage(),
        },
        locale: Locale('it', 'IT'),
      ),
    );
  }
}
