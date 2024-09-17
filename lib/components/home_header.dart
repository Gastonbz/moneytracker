import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';  // Importa FontAwesome para los íconos

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});  // Uso de super.key

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Balance:',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text(
            '\$1,000.00',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCard('Income', '\$1000.0', Colors.green, FontAwesomeIcons.dollarSign),  // Uso del ícono aquí
              _buildCard('Expense', '-\$500.0', Colors.red, FontAwesomeIcons.arrowUp),  // Otro ícono de ejemplo
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String amount, Color color, IconData icon) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, color: color),  // Uso del ícono aquí
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, color: color),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),  // Añadir const
            ),
          ],
        ),
      ),
    );
  }
}


