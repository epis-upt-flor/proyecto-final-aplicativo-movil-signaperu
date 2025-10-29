import 'package:flutter/material.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Práctica')),
      body: const Center(
        child: Text('Aquí va la práctica con cámara y validación'),
      ),
    );
  }
}
