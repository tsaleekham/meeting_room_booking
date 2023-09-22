import 'package:flutter/material.dart';

class POutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final Color? borderColor;
  const POutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: borderColor ?? Colors.black,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
