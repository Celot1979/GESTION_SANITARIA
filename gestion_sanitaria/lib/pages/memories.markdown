La ruta de la imagen del AppBar es: https://i.ibb.co/k1FXZJm/fundacion.jpg


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
   
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            
            automaticallyImplyLeading: false,
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
                    fontSize: 22, // Cambiado a tamaño 22
                    fontWeight: FontWeight.bold, // Se mantiene en negrita
                    decoration: TextDecoration.underline, // Añadido subrayado
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),
            backgroundColor: Colors.blue,
            elevation: 3,
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blueAccent, Colors.lightBlueAccent], // Degradado de 3 tonos de azul
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
