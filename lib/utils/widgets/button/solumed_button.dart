import 'package:flutter/material.dart';

class SolumedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onPressed;
  final Widget label;
  final double? width;
  final double height;
  final Color? color;
  final Gradient? gradient;

  const SolumedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.borderRadius,
    this.width,
    this.height = 35,
    this.color,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(20);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color.fromARGB(250, 26, 35, 126),
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        child: label,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: color ?? Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: borderRadius)),
      ),
    );
  }
}
