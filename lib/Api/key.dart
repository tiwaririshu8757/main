import 'package:flutter/material.dart';

class key extends StatelessWidget {
  const key({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(color: Colors.blueAccent.shade700,)),
    );
  }
}
