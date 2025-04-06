import 'package:flutter/material.dart';

class SplashButton extends StatelessWidget {
  const SplashButton({super.key, required this.title, this.onPressed});
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: const Size(200, 65)),
      child: Text(title),
    );
  }
}
