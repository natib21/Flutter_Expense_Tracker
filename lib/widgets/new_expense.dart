import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formater = DateFormat.yMd();

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key});
  @override
  State<NewExpenses> createState() {
    return _NewExpensesState();
  }
}

class _NewExpensesState extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  void _PresentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);
    _selectedDate = pickedDate;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration:
                      InputDecoration(prefixText: "\$ ", label: Text("Amount")),
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
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop((context));
                  },
                  child: Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: Text("Save Expense")),
            ],
          )
        ],
      ),
    );
  }
}
