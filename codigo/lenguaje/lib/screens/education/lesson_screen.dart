import 'package:flutter/material.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lección')),
      body: const Center(
        child: Text('Aquí va el contenido de la lección'),
      ),
    );
  }
}
