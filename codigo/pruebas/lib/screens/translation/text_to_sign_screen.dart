import 'package:flutter/material.dart';

class TextToSignScreen extends StatelessWidget {
  const TextToSignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(title: const Text('Texto a Señas'), backgroundColor: Colors.deepPurple),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.text_fields, size: 100, color: Colors.deepPurple),
            const SizedBox(height: 20),
            const Text('Escribe o habla para traducir', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () {},
              child: const Text('Traducir'),
            ),
          ],
        ),
      ),
    );
  }
}
