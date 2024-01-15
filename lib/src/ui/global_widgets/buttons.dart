import 'package:flutter/material.dart';

class BtnApp extends StatelessWidget {
  const BtnApp({
    super.key,
    this.onPressed,
    this.titleBtn,
    this.backgroundColor,
    this.width,
    this.isBorderRadius = true,
  });

  final String? titleBtn;
  final Function()? onPressed;
  final bool isBorderRadius;
  final Color? backgroundColor;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? 350, 45),
        backgroundColor: backgroundColor ?? Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: isBorderRadius ? BorderRadius.circular(8) : BorderRadius.zero,
        ),
      ),
      child: Text(titleBtn ?? "Registar", maxLines: 1, style: const TextStyle(fontSize: 18)),
    );
  }
}
