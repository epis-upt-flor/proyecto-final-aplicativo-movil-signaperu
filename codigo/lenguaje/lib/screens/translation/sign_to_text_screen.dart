import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'sign_model.dart';
import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';

class SignToTextScreen extends StatefulWidget {
  const SignToTextScreen({super.key});
  @override
  State<SignToTextScreen> createState() => _SignToTextScreenState();
}

class _SignToTextScreenState extends State<SignToTextScreen> {
  CameraController? _controller;
  bool _isCameraReady = false;
  bool _isProcessing = false;
  bool _modelsLoaded = false;

  late SignModel _signModel;
  late Interpreter _handLandmarkInterpreter;

  final List<String> labels = [
    "adios","bien","buenas_noches","buenas_tardes","buenos_dias",
    "como_estas","disculpa","gracias","hola-der","hola-izq",
    "mal","mas_o_menos","me_ayudas","por_favor"
  ];

  String _predictedLabel = '';

  @override
  void initState() {
    super.initState();
    _signModel = SignModel(labels: labels);
    _loadModels();
  }

  Future<void> _loadModels() async {
    try {
      await _signModel.loadModel('assets/actions_15.tflite');
      _handLandmarkInterpreter = await Interpreter.fromAsset('assets/hand_landmark.tflite');
      setState(() => _modelsLoaded = true);
      print('✅ Modelos cargados');
    } catch (e) {
      print('❌ Error cargando modelos: $e');
    }
  }

  Future<void> _initCamera() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Permiso de cámara denegado')));
      return;
    }

    final cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    await _controller!.initialize();
    setState(() => _isCameraReady = true);

    _controller!.startImageStream(_processCameraImage);
  }

  void _processCameraImage(CameraImage image) async {
    if (_isProcessing || !_modelsLoaded) return;
    _isProcessing = true;

    try {
      // Preprocesar imagen para MediaPipe
      Float32List input = _preprocessCameraImage(image);
      
      // Detectar landmarks
      final output = Float32List(63);
      _handLandmarkInterpreter.run(input, output);

      // Inferencia de la señal
      String label = _signModel.predict(output);
      
      // Actualizar UI solo si cambió
      if (label != _predictedLabel) {
        setState(() {
          _predictedLabel = label;
        });
      }
    } catch (e) {
      print('❌ Error en procesamiento: $e');
    } finally {
      _isProcessing = false;
    }
  }

  Float32List _preprocessCameraImage(CameraImage image) {
    // Aquí debes convertir CameraImage a formato esperado por MediaPipe
    // Ejemplo: convertir a RGB, redimensionar a 224x224 y normalizar
    // Este ejemplo es dummy, debes implementarlo según tu modelo
    final floatList = Float32List(224 * 224 * 3);
    // Implementa la normalización y redimensionamiento aquí
    return floatList;
  }

  @override
  void dispose() {
    _controller?.dispose();
    _handLandmarkInterpreter.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Señas a Texto')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _isCameraReady
                  ? _controller!.value.isInitialized
                      ? CameraPreview(_controller!)
                      : const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _initCamera,
                      child: const Text('Iniciar cámara'),
                    ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            color: Colors.deepPurple.shade100,
            child: Text(
              _predictedLabel.isEmpty
                  ? 'Aquí aparecerá la palabra'
                  : _predictedLabel,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
          ),
        ],
      ),
    );
  }
}