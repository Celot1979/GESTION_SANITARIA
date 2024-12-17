import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/pages/pop_ip_window.dart';
import 'package:gestion_sanitaria/servicies/map_services.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final roomChecker = RoomChecker();
    double coordx = 0.5;

    void showRoomDialog(String numeroHabitacion) {
      showDialog(
        context: context,
        builder: (BuildContext context) => PopupHabitacion(
          coordX: coordx,
          numeroHabitacion: numeroHabitacion,
        ),
      );
    }

    return Center(
      child: Container(
        child: Stack(
          children: [
            MouseRegion(
              onHover: (event) {
                if (roomChecker.isInRoom(event.localPosition, 3.75, 150, 590, 694, 1)) {
                  print('Ratón sobre Habitación 1');
                  showRoomDialog('1');
                }
                if (roomChecker.isInRoom(event.localPosition, 3.75, 150, 480, 580, 2)) {
                  print('Ratón sobre Habitación 2');
                  showRoomDialog('2');
                }
                if (roomChecker.isInRoom(event.localPosition, 120, 190, 22.4, 140, 6)) {
                  print('Ratón sobre Habitación 6');
                  showRoomDialog('6');
                }
                if (roomChecker.isInRoom(event.localPosition, 3.75, 150, 295, 406, 3)) {
                  print('Ratón sobre Habitación 3');
                  showRoomDialog('3');
                }
                if (roomChecker.isInRoom(event.localPosition, 3.75, 150, 175, 289, 4)) {
                  print('Ratón sobre Habitación 4');
                  showRoomDialog('4');
                }
                if (roomChecker.isInRoom(event.localPosition, 15, 90, 24, 140, 5)) {
                  print('Ratón sobre Habitación 5');
                  showRoomDialog('5');
                }
              },
              child: Image.network('https://i.ibb.co/7XZvmGc/plano-Editado.png'),
            ),
            /*Aquí estaba la parte del código que nos dibujaba los cuadrados encima del croquis.*/
            //roomChecker.buildRoomHighlight(15,90,24,120), //5
            //roomChecker.buildRoomHighlight(120,190, 22.4, 140), //6
            //roomChecker.buildRoomHighlight(3.75,150,175,289), //4
            //roomChecker.buildRoomHighlight(3.75,150,295,406), //3
            //roomChecker.buildRoomHighlight(3.75,150,480,580), //2
            //roomChecker.buildRoomHighlight(3.75,150,590,694), //1
          ],
        ),
      ),
    );
  }
}