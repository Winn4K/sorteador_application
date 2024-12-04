// lib/Samples/InicioSorteador/Inicio_Sorteador_Sample_Screen.dart

import 'package:flutter/material.dart';
import '../HomeSorteador/Home_Sorteador_Sample_Screen.dart'; // Importa a HomeSorteadorSampleScreen
import '../../Components/Header/header.dart';
import '../../Components/Footer/footer.dart';
import '../../Components/Header/header_view_model.dart';
import '../../Components/Footer/footer_view_model.dart';

class InicioSorteadorSampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header com o título "SORTEADOR"
          Header(
            viewModel: HeaderViewModel(title: 'SORTEADOR'),
          ),

          // Conteúdo principal com fundo branco e botão "Entrar"
          Expanded(
            child: Container(
              color: Colors.white, // Fundo branco
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Cor laranja do botão
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 16.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    // Navega para a HomeSorteadorSampleScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeSorteadorSampleScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Footer com texto de copyright
          Footer(
            viewModel: FooterViewModel(copyright: '© 2024 Sorteador App'),
          ),
        ],
      ),
    );
  }
}
