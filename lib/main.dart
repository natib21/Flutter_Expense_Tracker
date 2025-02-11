import 'package:expense_tracker/widgets/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var KColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 42, 2, 136));

var KDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Color.fromARGB(255, 5, 99, 125));
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((fn) {
  runApp(MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: KDarkColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: KDarkColorScheme.primary,
            // foregroundColor: KColorScheme.onPrimary,
          ),
          cardTheme: CardTheme().copyWith(
            color: KDarkColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: KDarkColorScheme.primaryContainer,
          )),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: KDarkColorScheme.onSecondaryContainer),
              )),
      theme: ThemeData().copyWith(
          colorScheme: KColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: KColorScheme.primary,
            // foregroundColor: KColorScheme.onPrimary,
          ),
          cardTheme: CardTheme().copyWith(
            color: KColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: KColorScheme.primaryContainer,
          )),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: KColorScheme.onSecondaryContainer),
              )),
      themeMode: ThemeMode.system,
      home: Expense()));
  // });
}
// lecture 05/10
