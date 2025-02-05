import "package:uuid/uuid.dart";

final uuid = const Uuid();

class Expenses {
  Expenses({required this.title, required this.amount, required this.date})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
}
