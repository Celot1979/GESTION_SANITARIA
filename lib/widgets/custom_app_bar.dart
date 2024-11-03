import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importa el paquete url_launcher

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String imageUrl; // URL de la imagen
  final String title; // Título del AppBar
  final String subtitle; // Subtítulo del AppBar
  final String linkUrl; // URL del hipervínculo

  const CustomAppBar({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.linkUrl, // Se añade la URL del hipervínculo como parámetro
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 200,
      flexibleSpace: GestureDetector( // Añadido GestureDetector para hacer clic en la imagen
        onTap: () async {
          if (await canLaunch(linkUrl)) { // Verifica si se puede abrir la URL
            await launch(linkUrl); // Abre la URL
          } else {
            throw 'No se pudo abrir $linkUrl'; // Manejo de errores
          }
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl), // Carga la imagen desde la URL
              fit: BoxFit.cover, // La imagen llena todo el AppBar
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title, // Usar el título pasado como parámetro
                style: const TextStyle(
                  color: Colors.white, // Color del texto
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle, // Usar el subtítulo pasado como parámetro
                style: const TextStyle(
                  color: Colors.white, // Color del texto
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
