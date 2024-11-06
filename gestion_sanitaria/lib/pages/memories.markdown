import 'package:flutter/material.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Aquí puedes usar un widget de mapa, como Google Maps o cualquier otro
      child: Center(
        child: Image.network('https://i.ibb.co/7XZvmGc/plano-Editado.png'), // Cambia 'URL_DEL_MAPA_AQUI' por la URL real del mapa
      ),
    );
  }
} 