import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Conver",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 30),
          ),
          Text(
            'sor',
            style: TextStyle(
                color: Colors.green, fontStyle: FontStyle.italic, fontSize: 30),
          )
        ],
      ),
    );
  }
}
