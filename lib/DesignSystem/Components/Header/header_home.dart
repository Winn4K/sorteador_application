// lib/DesignSystem/Components/Header/header_home.dart

import 'package:flutter/material.dart';
import 'header_home_view_model.dart';
import '../../Samples/InicioSorteador/Inicio_Sorteador_Sample_Sreen.dart'; // Importando a tela de destino

class HeaderHome extends StatelessWidget {
  final HeaderHomeViewModel viewModel;

  const HeaderHome({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () {
              // Navegação para a tela de sorteador
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InicioSorteadorSampleScreen(),
                ),
              );
            },
          ),
          Center(
            child: Text(
              viewModel.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 48), // Espaço para manter o alinhamento do título
        ],
      ),
    );
  }
}
