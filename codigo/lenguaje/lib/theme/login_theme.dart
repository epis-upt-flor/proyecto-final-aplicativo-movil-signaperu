import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart'; // Importa todo el paquete

final myLoginTheme = LoginTheme(
  primaryColor: Colors.deepPurple,
  accentColor: Colors.orange,
  errorColor: Colors.redAccent,
  titleStyle: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  ),
  bodyStyle: const TextStyle(
    fontStyle: FontStyle.italic,
    fontSize: 16,
  ),
  textFieldStyle: const TextStyle(
    color: Colors.black87,
  ),
  buttonStyle: const TextStyle(
    fontWeight: FontWeight.w800,
    color: Colors.white,
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 5,
    margin: const EdgeInsets.only(top: 15),
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(100.0),
    ),
  ),
);
