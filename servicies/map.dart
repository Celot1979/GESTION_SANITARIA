import 'package:flutter/material.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Aquí puedes usar un widget de mapa, como Google Maps o cualquier otro
        Center(
          child: Text('Mapa centrado aquí'), // Reemplaza esto con el widget del mapa
        ),
      ],
    );
  }
} 