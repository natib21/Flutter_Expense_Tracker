import 'package:expense_tracker/widgets/expenses_list/expenese_list.dart';
import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Expense Tracker",
            style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
          )
        ],
        backgroundColor: const Color.fromARGB(255, 1, 17, 109),
      ),
      body: Column(
        children: [
          Text("The Chart"),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          )
        ],
      ),
    );
  }
}
