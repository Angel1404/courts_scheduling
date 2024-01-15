import 'package:flutter/material.dart';

class BodyTemplate extends StatelessWidget {
  const BodyTemplate({super.key, this.child, this.isScroll = false});
  final Widget? child;
  final bool isScroll;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: isScroll
          ? SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 25),
              physics: const BouncingScrollPhysics(),
              child: child,
            )
          : child,
    );
  }
}
