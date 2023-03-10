import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prenotacorsi/store.dart';
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
        theme: ThemeData(
                fontFamily: GoogleFonts.bebasNeue().fontFamily,
                colorScheme: ColorScheme.light())
            .copyWith(
          buttonTheme: ButtonThemeData(),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.deepOrange;
                  } else {
                    return Colors.deepOrange;
                  }
                },
              ),
            ),
          ),
        ),
        home: MyListWidget(),
        routes: {
          '/login': (context) => LoginPage(),
          '/list': (context) => MyListWidget(),
        },
        locale: Locale('it', 'IT'),
      ),
    );
  }
}
