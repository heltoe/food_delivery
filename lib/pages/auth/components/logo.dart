import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 80,
        backgroundImage: AssetImage("assets/images/splash1.webp"),
      ),
    );
  }
}