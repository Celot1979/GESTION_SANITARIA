import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color textColor;
  final Color buttonColor;
  final double borderRadius;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry margin;
  final double? horizontalSize;

  CustomButton({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.textStyle,
    this.textColor = Colors.white,
    this.buttonColor = Colors.blue,
    this.borderRadius = 8,
    required this.onPressed,
    this.margin = const EdgeInsets.only(top: 16.0),
    this.horizontalSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonWidth = width ?? screenSize.width * 0.8;
    final buttonHeight = height ?? screenSize.height * 0.07;

    return GestureDetector(
      onTapDown: (_) => _onTapDown(context),
      onTapUp: (_) => _onTapUp(context),
      onTapCancel: () => _onTapCancel(context),
      child: Container(
        margin: margin,
        width: horizontalSize != null ? screenSize.width * horizontalSize! : buttonWidth,
        child: SizedBox(
          height: buttonHeight,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.identity()..scale(_scale),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Text(
                text,
                style: textStyle?.copyWith(color: textColor) ?? TextStyle(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _scale = 1.0;

  void _onTapDown(BuildContext context) {
    _scale = 0.95; // Efecto de escala al presionar
  }

  void _onTapUp(BuildContext context) {
    _scale = 1.0; // Regresar a la escala original
  }

  void _onTapCancel(BuildContext context) {
    _scale = 1.0; // Regresar a la escala original si se cancela
  }
}
