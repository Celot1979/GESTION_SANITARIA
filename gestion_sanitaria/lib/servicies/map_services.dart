import 'package:flutter/material.dart';

class RoomChecker {
  bool isInRoom(Offset position, double x1, double x2, double y1, double y2, int roomNumber) {
    double tolerance = 5; // Rango de tolerancia

    // Imprimir la posición del ratón para depuración
    //print('Posición del ratón - X: ${position.dx}, Y: ${position.dy}');

    // Imprimir el número de la habitación para depuración
    //print('Número de habitación: $roomNumber');

    // Verificar si la posición está dentro del cuadrado con tolerancia
    bool isInRoom = position.dx >= (x1 - tolerance) && position.dx <= (x2 + tolerance) &&
                    position.dy >= (y1 - tolerance) && position.dy <= (y2 + tolerance);

    // Imprimir si está en la habitación
    /*if (isInRoom) {
      print('EL RATÓN SI ESTÁ EN LA HABITACIÓN $roomNumber');
    } else {
      print('El ratón NO está en la habitación');
    }*/

    return isInRoom;
  }

  // Nueva función para dibujar los cuadrados
  Widget buildRoomHighlight(double x1, double x2, double y1, double y2) {
    return Positioned(
      left: x1,
      top: y1,
      child: Container(
        width: x2 - x1,
        height: y2 - y1,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 2), // Color y grosor del borde
        ),
      ),
    );
  }
}
