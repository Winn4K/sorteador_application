// lib/DesignSystem/Components/Header/header.dart

import 'package:flutter/material.dart';
import 'header_view_model.dart';

class Header extends StatelessWidget {
  final HeaderViewModel viewModel;

  const Header({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.orange,
      child: Center(
        child: Text(
          viewModel.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
