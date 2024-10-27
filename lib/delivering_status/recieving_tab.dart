import 'package:flutter/material.dart';

class Recieved extends StatelessWidget {
  const Recieved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.green,
          child: const Center(
            child: Text("Recieved"),
          ),
        ),
      ),
    );
  }
}
