import 'package:flutter/material.dart';

class BottomLayout extends StatelessWidget {
  final Widget child;
  const BottomLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
          topRight: Radius.circular(30),
        ),
      ),
      child: child,
    );
  }
}
