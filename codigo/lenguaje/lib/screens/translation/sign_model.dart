import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:typed_data';

class SignModel {
  late Interpreter _interpreter;
  final List<String> labels;

  SignModel({required this.labels});

  Future<void> loadModel(String modelPath) async {
    _interpreter = await Interpreter.fromAsset(modelPath);
  }

  // input: Float32List normalizada [0,1], tamaño 64x64
  String predict(Float32List inputBytes) {
    // input reshape ya no es necesario
    var input = inputBytes.buffer.asFloat32List(); // 1x64x64x1 depende del modelo
    var output = Float32List(labels.length);

    _interpreter.run(input, output);

    // obtener índice de mayor probabilidad
    int maxIndex = 0;
    double maxValue = output[0];
    for (int i = 1; i < labels.length; i++) {
      if (output[i] > maxValue) {
        maxValue = output[i];
        maxIndex = i;
      }
    }
    return labels[maxIndex];
  }
}
