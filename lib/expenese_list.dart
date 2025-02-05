import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expenses> expenses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (ctx, index) => Text(expenses[index].title))
      ],
    );
  }
}
