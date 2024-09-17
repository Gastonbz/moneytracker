import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker2/main.dart';  // Asegúrate de que esta ruta sea correcta y el nombre de la clase sea el correcto

void main() {
  testWidgets('App loads correctly', (WidgetTester tester) async {
    // Reemplaza 'MyApp' con el nombre correcto de tu clase principal
    await tester.pumpWidget(const MyApp());  
    // Añade aquí tus pruebas
  });
}
