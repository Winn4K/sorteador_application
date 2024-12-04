// lib/main.dart

import 'package:flutter/material.dart';
import './DesignSystem/Samples/InicioSorteador/Inicio_Sorteador_Sample_Sreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      title: 'Sorteador App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: InicioSorteadorSampleScreen(), // Chama a tela inicial
    );
  }
}
