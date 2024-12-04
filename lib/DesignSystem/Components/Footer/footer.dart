// lib/DesignSystem/Components/Footer/footer.dart

import 'package:flutter/material.dart';
import 'footer_view_model.dart';

class Footer extends StatelessWidget {
  final FooterViewModel viewModel;

  const Footer({
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
          viewModel.copyright,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
