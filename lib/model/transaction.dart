// lib/model/transaction.dart
enum TransactionType {
  income,
  expense,
}

class Transaction {
  final TransactionType type;
  final double amount;
  final String description;

  // Constructor
  Transaction({
    required this.type,
    required this.amount,
    required this.description,
  });
}
