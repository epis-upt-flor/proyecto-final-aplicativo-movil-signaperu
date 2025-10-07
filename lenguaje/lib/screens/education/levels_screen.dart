import 'package:flutter/material.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(title: const Text('Niveles de Aprendizaje'), backgroundColor: Colors.deepPurple),
      body: ListView(
        children: const [
          ListTile(title: Text('Nivel Básico'), trailing: Icon(Icons.arrow_forward)),
          ListTile(title: Text('Nivel Intermedio'), trailing: Icon(Icons.arrow_forward)),
          ListTile(title: Text('Nivel Avanzado'), trailing: Icon(Icons.arrow_forward)),
        ],
      ),
    );
  }
}
