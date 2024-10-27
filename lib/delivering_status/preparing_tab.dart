import 'package:flutter/material.dart';

class Preparing extends StatelessWidget {
  const Preparing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: const Center(
            child: Text("Preparing"),
          ),
        ),
      ),
    );
  }
}
