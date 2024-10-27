import 'package:flutter/material.dart';

class Delivering extends StatelessWidget {
  const Delivering({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blue,
          child: const Center(
            child: Text("Delivering"),
          ),
        ),
      ),
    );
  }
}
