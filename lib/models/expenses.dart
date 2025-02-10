import 'package:flutter/material.dart';
import "package:uuid/uuid.dart";
import 'package:intl/intl.dart';

final formater = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leuisure, work }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.leuisure: Icons.movie,
  Category.work: Icons.work
};

class Expenses {
  Expenses(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatedDate {
    return formater.format(date);
  }
}

class ExpenseBucket {
  final List<Expenses> expenses;
  final Category category;
  ExpenseBucket({required this.expenses, required this.category});

  ExpenseBucket.forCategory(List<Expenses> allExpenses, this.category)
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0;

    for (final expenses in expenses) {
      sum += expenses.amount;
    }

    return sum;
  }
}
