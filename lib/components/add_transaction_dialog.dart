
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({super.key});

  @override
  _AddTransactionDialogState createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  int typeIndex = 0; 
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'New Transaction',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            CupertinoSlidingSegmentedControl(
              groupValue: typeIndex,
              children: const {
                0: Text('Income'),
                1: Text('Expense'),
              },
              onValueChanged: (value) {
                setState(() {
                  typeIndex = value as int;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'AMOUNT',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.teal, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: amountController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: '\$ 0.00',
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 20),
            Text(
              'DESCRIPTION',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.teal, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: descriptionController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter description',
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí podrías agregar la lógica para manejar la nueva transacción con descripción
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


