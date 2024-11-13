import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    required this.controller, required Null Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // Obtener el ancho de la pantalla

    return SizedBox(
      width: screenWidth * 0.8, // Ajustar el ancho del TextField al 80% del ancho de la pantalla
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText, // Agregado para mostrar el nombre del campo
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        keyboardType: keyboardType,
        controller: controller,
      ),
    );
  }
}
