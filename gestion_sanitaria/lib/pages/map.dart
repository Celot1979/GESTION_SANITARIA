import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/pages/pop_ip_window.dart';
import 'package:gestion_sanitaria/servicies/map_services.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final roomChecker = RoomChecker();
    double coordx =0.5;
    

    return  Center(
      child: Stack(
        children: [
          MouseRegion(
            onHover: (event) {
              if (roomChecker.isInRoom(event.localPosition, 3.75,108,537,610, 1)) {
                print('Ratón sobre Habitación 1');
                showDialog(
                  context: context,
                  builder: (BuildContext context) => PopupHabitacion(
                    coordX: coordx,
                    numeroHabitacion: '1',
                  ),
                );
              }
              if (roomChecker.isInRoom(event.localPosition,3.75,108,442,510, 2)) {
                print('Ratón sobre Habitación 2');
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>  PopupHabitacion(
                    coordX: coordx,
                    numeroHabitacion: '2',
                  ),
                );
              }
              if (roomChecker.isInRoom(event.localPosition, 105,150, 22.4, 103, 6)) {
                print('Ratón sobre Habitación 6');
                showDialog(
                  context: context,
                  builder: (BuildContext context) => PopupHabitacion(
                    coordX: coordx,
                    numeroHabitacion: '6',
                  ),
                );
              }
              if (roomChecker.isInRoom(event.localPosition, 3.75,108,287,355, 3)) {
                print('Ratón sobre Habitación 3');
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>  PopupHabitacion(
                    coordX: coordx,
                    numeroHabitacion: '3',
                  ),
                );
              }
              if (roomChecker.isInRoom(event.localPosition, 4,108,187,253, 4)) {
                print('Ratón sobre Habitación 4');
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>  PopupHabitacion(
                    coordX: coordx,
                    numeroHabitacion: '4',
                  ),
                );
              }
              if (roomChecker.isInRoom(event.localPosition, 15,60,22.4,103, 5)) {
                print('Ratón sobre Habitación 5');
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>  PopupHabitacion(
                    coordX: coordx,
                    numeroHabitacion: '5',
                  ),
                );
    
                return;
              }
            },
            child:
                Image.network('https://i.ibb.co/7XZvmGc/plano-Editado.png'),
          ),
          /*Aquí estaba la parte del código que nos dibujaba los cuadrados encima del croquis.*/
          //roomChecker.buildRoomHighlight(15,60,24,103), //5
          //roomChecker.buildRoomHighlight(105,150, 22.4, 103), //6
          //roomChecker.buildRoomHighlight(4,108,187,253), //4
          //roomChecker.buildRoomHighlight(3.75,108,287,355), //3
          //roomChecker.buildRoomHighlight(3.75,108,442,510), //2
          //roomChecker.buildRoomHighlight(3.75,108,537,610), //1
        ],
      ),
    );
  }
}