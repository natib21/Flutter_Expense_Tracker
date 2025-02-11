import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

final formater = DateFormat.yMd();

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.addExpense});

  final void Function(Expenses expense) addExpense;

  @override
  State<NewExpenses> createState() {
    return _NewExpensesState();
  }
}

class _NewExpensesState extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leuisure;

  void _PresentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsValid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsValid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text("Invalid Input"),
              content: Text("Please enter valid data"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: Text("Okay"))
              ],
            );
          });
      return;
    }
    widget.addExpense(Expenses(
      title: _titleController.text,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory,
    ));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (ctx, Constraints) {
        final width = Constraints.maxWidth;

        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, keyboard + 16),
              child: Column(
                children: [
                  if (width >= 600)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _titleController,
                            maxLength: 50,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(label: Text("Title")),
                          ),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            decoration: InputDecoration(
                                prefixText: "\$ ", label: Text("Amount")),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    )
                  else
                    TextField(
                      controller: _titleController,
                      maxLength: 50,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(label: Text("Title")),
                    ),
                  if (width >= 600)
                    Row(
                      children: [
                        DropdownButton(
                            value: _selectedCategory,
                            items: Category.values
                                .map(
                                  (category) => DropdownMenuItem(
                                    value: category,
                                    child: Text(
                                      category.name.toUpperCase(),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              setState(() {
                                _selectedCategory = value;
                              });
                            }),
                        SizedBox(width: 24),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(_selectedDate == null
                                ? "No Date Chosen"
                                : formater.format(_selectedDate!)),
                            IconButton(
                              icon: Icon(Icons.calendar_month),
                              onPressed: _PresentDatePicker,
                            )
                          ],
                        ))
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            decoration: InputDecoration(
                                prefixText: "\$ ", label: Text("Amount")),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(_selectedDate == null
                                ? "No Date Chosen"
                                : formater.format(_selectedDate!)),
                            IconButton(
                              icon: Icon(Icons.calendar_month),
                              onPressed: _PresentDatePicker,
                            )
                          ],
                        ))
                      ],
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  if (width >= 600)
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop((context));
                            },
                            child: Text("Cancel")),
                        Spacer(),
                        ElevatedButton(
                            onPressed: _submitExpenseData,
                            child: Text("Save Expense")),
                      ],
                    )
                  else
                    Row(
                      children: [
                        DropdownButton(
                            value: _selectedCategory,
                            items: Category.values
                                .map(
                                  (category) => DropdownMenuItem(
                                    value: category,
                                    child: Text(
                                      category.name.toUpperCase(),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              setState(() {
                                _selectedCategory = value;
                              });
                            }),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.pop((context));
                            },
                            child: Text("Cancel")),
                        ElevatedButton(
                            onPressed: _submitExpenseData,
                            child: Text("Save Expense")),
                      ],
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
