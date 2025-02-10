import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/expenses_list/expenese_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.rmvExpense});

  final List<Expenses> expenses;
  final void Function(Expenses) rmvExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withValues(
                  alpha: 0.8), //Theme.of(context).colorScheme.error,
              margin: Theme.of(context).cardTheme!.margin,
            ),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              rmvExpense(expenses[index]);
            },
            child: ExpenseItem(expenses[index])));
  }
}
