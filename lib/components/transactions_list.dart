
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});  // Uso de super.key

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [  // Añadir const para mejorar el rendimiento
        _TransactionItem(
          type: 'Income',
          category: 'Salary',
          amount: '\$1,000.00',
          color: Colors.green,
        ),
        _TransactionItem(
          type: 'Expense',
          category: 'Rent',
          amount: '-\$500.00',
          color: Colors.red,
        ),
      ],
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String type;
  final String category;
  final String amount;
  final Color color;

  const _TransactionItem({
    required this.type,
    required this.category,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          type == 'Income' ? Icons.arrow_downward : Icons.arrow_upward,
          color: color,
        ),
        title: Text(category),
        trailing: Text(
          amount,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
