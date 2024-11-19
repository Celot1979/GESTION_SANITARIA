import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/pages/pop_ip_window.dart';
import 'package:gestion_sanitaria/servicies/map_services.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final roomChecker = RoomChecker();

    return  Container(
      child: Center(
        child: Stack(
          children: [
            MouseRegion(
              onHover: (event) {
                if (roomChecker.isInRoom(event.localPosition, 4, 136, 680, 765, 1)) {
                  print('Ratón sobre Habitación 1');
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => const PopupHabitacion(
                      coordX: 136.0,
                      numeroHabitacion: "1",
                    ),
                  );
                }
                if (roomChecker.isInRoom(event.localPosition, 4, 136, 556, 640, 2)) {
                  print('Ratón sobre Habitación 2');
                }
                if (roomChecker.isInRoom(event.localPosition, 130, 185, 29, 132, 6)) {
                  print('Ratón sobre Habitación 6');
                }
                if (roomChecker.isInRoom(event.localPosition, 4, 136, 361, 446, 3)) {
                  print('Ratón sobre Habitación 3');
                }
                if (roomChecker.isInRoom(event.localPosition, 4, 136, 233, 317, 4)) {
                  print('Ratón sobre Habitación 4');
                }
                if (roomChecker.isInRoom(event.localPosition, 20, 70, 29, 132, 5)) {
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

habitación 1 = 4, 136, 680, 765 .habitación 2 = 4, 136, 556, 640 , habitación 3 =  4, 136, 361, 446, habitación 4 = 4, 136, 233, 317, habitacion 5 = 20, 70, 29, 132, habitación 6 = 130, 185, 29, 132,

Este código es parte de la interfaz para implentar pacientes a la colección de firebase con el nombre "paciente". Tengo varias TextEditinController para guardar lo que en los TextField tengan en su interior, introduccidos por los usuarios. Tengo un roomController, full_nameController, pathologyControler,timeController y name_medicationController. En la colección de Firebase tengo room ( que sería rellenada por el roomController), , fullname(que sería lo que tenga full_nameControler), pathology(que sería lo que está guardado en pathologyControler), medication(que sería lo que está guardardo name_medicationController) y por último time(que sería lo que está guardado en timeControler). 

 await addRegistroP(roomControler.text,full_nameControler.text,name_medicationControler.text,pathologyControler.text, name_medicationControler.text );