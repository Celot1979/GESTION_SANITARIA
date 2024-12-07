import 'package:gestion_sanitaria/servicies/pacient_verification.dart';
import 'package:flutter/material.dart'; // Añadir esta importación



class PopupHabitacion extends StatelessWidget {
  final double coordX;
  final String numeroHabitacion;

  const PopupHabitacion({
    super.key,
    required this.coordX,
    required this.numeroHabitacion,
  });
  @override
  Widget build(BuildContext context) {
  
    return Stack(
      children: [
        Positioned(
          left: coordX,
          top: 50,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueAccent, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: FutureBuilder(
                future: PacientVerification().checkRoomExists(numeroHabitacion),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final userInfo = PacientVerification.userInfo; // Llamada al getter
                    return Text(
                      'La habitación $numeroHabitacion \n'//existe: ${snapshot.data}'
                      'Información del paciente\n'
                      'Nombre completo: ${userInfo['fullname']}\n'
                      'Patología: ${userInfo['pathology']}\n'
                      'Medicación: ${userInfo['medication']}\n'
                      'Tiempo: ${userInfo['time']}',
                      style: const TextStyle(
                        fontSize: 20, // Tamaño de fuente
                        fontWeight: FontWeight.bold, // Negrita
                        color: Colors.black, // Color del texto
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}