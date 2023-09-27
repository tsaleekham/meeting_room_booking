import 'package:flutter/material.dart';

class PButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final MaterialStateProperty<Color?>? backgroundColor;
  final bool disabled;
  const PButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        backgroundColor: backgroundColor ??
            const MaterialStatePropertyAll(
              Color(0xFF5CC99B),
            ),
      ),
      onPressed: disabled ? null : onPressed,
      child: child,
    );
  }
}
