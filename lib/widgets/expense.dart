import 'package:expense_tracker/widgets/expenses_list/expenese_list.dart';
import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});
  @override
  State<Expense> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expense> {
  final List<Expenses> _registeredExpenses = [
    Expenses(
        title: "Flutter Course",
        amount: 10.99,
        date: DateTime.now(),
        category: Category.work),
    Expenses(
        title: "Cinema",
        amount: 15.99,
        date: DateTime.now(),
        category: Category.leuisure),
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.all(10),
            child: NewExpenses(
              addExpense: _addExpens,
            ),
          );
        });
  }

  void _addExpens(Expenses expenses) {
    setState(() {
      _registeredExpenses.add(expenses);
    });
  }

  void _removeExpense(Expenses expenses) {
    final expenseIndex = _registeredExpenses.indexOf(expenses);
    setState(() {
      _registeredExpenses.remove(expenses);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Expense removed"),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expenses);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expenses added yet!"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        rmvExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Expense Tracker",
            style: GoogleFonts.roboto(
                fontSize: 20,
                // fontWeight: FontWeight.bold,
                color: Colors.white)),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
      body: Column(
        children: [
          Text("The Chart"),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
