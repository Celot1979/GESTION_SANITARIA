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

    void handleMouseHover(Offset localPosition) {
      final habitaciones = [
        {'coords': [3.75, 150, 590, 694], 'numero': '1'},
        {'coords': [3.75, 150, 480, 580], 'numero': '2'},
        {'coords': [120, 190, 22.4, 140], 'numero': '6'},
        {'coords': [3.75, 150, 295, 406], 'numero': '3'},
        {'coords': [3.75, 150, 175, 289], 'numero': '4'},
        {'coords': [15, 90, 24, 140], 'numero': '5'},
      ];

      for (var habitacion in habitaciones) {
        if (roomChecker.isInRoom(
          localPosition,
          (habitacion['coords'] as List)[0],
          (habitacion['coords'] as List)[1],
          (habitacion['coords'] as List)[2],
          (habitacion['coords'] as List)[3],
          int.parse(habitacion['numero'] as String),
        )) {
          print('Ratón sobre Habitación ${habitacion['numero']}');
          showRoomDialog(habitacion['numero'] as String);
          break;
        }
      }
    }

    return Center(
      child: Container(
        child: Stack(
          children: [
            MouseRegion(
              onHover: (event) => handleMouseHover(event.localPosition),
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