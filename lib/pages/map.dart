import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/servicies/map_services.dart';


class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final roomChecker = RoomChecker();

    return Container(
      child: Center(
        child: MouseRegion(
          onHover: (event) {
            if (roomChecker.isInRoom(event.localPosition, 25, 70, 35, 120)) {
              print('Habitación 1 desde arriba');
            }
          },
          child: Image.network('https://i.ibb.co/7XZvmGc/plano-Editado.png'),
        ),
      ),
    );
  }
} 