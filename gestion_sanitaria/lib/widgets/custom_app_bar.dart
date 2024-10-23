import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100, // Aumenta la altura de la barra de la aplicación
      title: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            subtitle.toUpperCase(), // Convierte el subtítulo a mayúsculas
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),
      backgroundColor: Colors.blue,
      elevation: 3,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
