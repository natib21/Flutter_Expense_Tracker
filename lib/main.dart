import 'package:expense_tracker/widgets/expense.dart';
import 'package:flutter/material.dart';

var KColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 48, 14, 126));

void main() {
  runApp(MaterialApp(
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
      home: Expense()));
}
// lecture 05/10
