import 'package:flutter/material.dart';
import 'package:money_tracker2/components/add_transaction_dialog.dart';
import 'package:provider/provider.dart';
import '../../model/transaction.dart';
import '../../controller/transactions_provider.dart';  // Ajusta la importación según tu estructura
import 'package:money_tracker2/components/add_transaction_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionsProvider>(context);
    final balance = provider.getBalance().toStringAsFixed(2);  // Usa el método correcto para obtener el balance
    final totalIncomes = provider.getTotalIncomes().toStringAsFixed(2);  // Usa el método correcto para obtener ingresos
    final totalExpenses = provider.getTotalExpenses().toStringAsFixed(2);  // Usa el método correcto para obtener gastos

    return Scaffold(
      appBar: AppBar(
        title: const Text('MONEY TRACKER'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Balance: \$ $balance', style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCard('Income', '\$$totalIncomes', Colors.green),
                    _buildCard('Expense', '-\$$totalExpenses', Colors.red),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(
            child: TransactionList(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const AddTransactionDialog(),
              ),
              child: const Text('Add Transaction'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String amount, Color color) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 16, color: color)),
            const SizedBox(height: 8),
            Text(amount, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<TransactionsProvider>().transactions;

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        final isExpense = transaction.type == TransactionType.expense;
        final amount = '${isExpense ? '- ' : ''}\$${transaction.amount.abs().toStringAsFixed(2)}';
        return ListTile(
          title: Text(transaction.description),
          subtitle: Text(isExpense ? 'Expense' : 'Income'),
          trailing: Text(
            amount,
            style: TextStyle(color: isExpense ? Colors.red : Colors.green),
          ),
        );
      },
    );
  }
}

