import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/pages/pop_ip_window.dart';
import 'package:gestion_sanitaria/servicies/map_services.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final roomChecker = RoomChecker();

    return Container(
      child: Center(
        child: Stack(
          children: [
            MouseRegion(
              onHover: (event) {
                if (roomChecker.isInRoom(
                    event.localPosition, 4, 136, 680, 765, 1)) {
                  print('Ratón sobre Habitación 1');
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => const PopupHabitacion(
                      coordX: 136.0,
                      numeroHabitacion: "1",
                    ),
                  );
                }
                if (roomChecker.isInRoom(
                    event.localPosition, 4, 136, 556, 640, 2)) {
                  print('Ratón sobre Habitación 2');
                }
                if (roomChecker.isInRoom(
                    event.localPosition, 130, 185, 29, 132, 6)) {
                  print('Ratón sobre Habitación 6');
                }
                if (roomChecker.isInRoom(
                    event.localPosition, 4, 136, 361, 446, 3)) {
                  print('Ratón sobre Habitación 3');
                }
                if (roomChecker.isInRoom(
                    event.localPosition, 4, 136, 233, 317, 4)) {
                  print('Ratón sobre Habitación 4');
                }
                if (roomChecker.isInRoom(
                    event.localPosition, 20, 70, 29, 132, 5)) {
                  print('Ratón sobre Habitación 5');

                  return;
                }
              },
              child:
                  Image.network('https://i.ibb.co/7XZvmGc/plano-Editado.png'),
            ),
            /*Aquí estaba la parte del código que nos dibujaba los cuadrados encima del croquis.*/
            /*roomChecker.buildRoomHighlight(20, 70, 29, 132), //5
            roomChecker.buildRoomHighlight(130, 185, 29, 132), //6
            roomChecker.buildRoomHighlight(5, 136, 233, 317), //4
            roomChecker.buildRoomHighlight(4, 136, 361, 446), //3
            roomChecker.buildRoomHighlight(4, 136, 556, 640), //2

            roomChecker.buildRoomHighlight(4, 136, 680, 765), //1*/
          ],
        ),
      ),
    );
  }
}