import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class SignToTextScreen extends StatefulWidget {
  const SignToTextScreen({super.key});

  @override
  State<SignToTextScreen> createState() => _SignToTextScreenState();
}

class _SignToTextScreenState extends State<SignToTextScreen> {
  CameraController? _controller;
  bool _isCameraReady = false;

  Future<void> _initCamera() async {
    final cameraStatus = await Permission.camera.request();
    final micStatus = await Permission.microphone.request();

    if (cameraStatus.isGranted && micStatus.isGranted) {
      final cameras = await availableCameras();
      _controller = CameraController(cameras[0], ResolutionPreset.medium);
      await _controller!.initialize();
      setState(() {
        _isCameraReady = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Se requieren permisos de cámara y micrófono')),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text('Señas a Texto'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: _isCameraReady
            ? CameraPreview(_controller!)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.pan_tool, size: 100, color: Colors.deepPurple),
                  const SizedBox(height: 20),
                  const Text('Vista previa de cámara', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                    onPressed: _initCamera,
                    child: const Text('Iniciar reconocimiento'),
                  ),
                ],
              ),
      ),
    );
  }
}
