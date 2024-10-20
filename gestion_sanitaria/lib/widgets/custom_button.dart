import 'package:flutter/material.dart';

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

  const CustomButton({
    Key? key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: horizontalSize != null ? MediaQuery.of(context).size.width * horizontalSize! : width,
      child: SizedBox(
        height: height,
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
    );
  }
}
