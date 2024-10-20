import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/widgets/custom_Textfield.dart';
import 'package:gestion_sanitaria/widgets/custom_button.dart';



class Home extends StatefulWidget {
  const Home({
    super.key,
  });
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameControler = TextEditingController(text: " ");
  TextEditingController movilControler = TextEditingController(text: " ");
  TextEditingController emailControler = TextEditingController(text: " ");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HEALTH MANAGEMENT",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 2,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const SizedBox(width: 16),
           
            CustomTextField(
              controller: emailControler,
              hintText: "add email address",
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: movilControler,
              hintText: "add mobile phone number ",
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            CustomButton(
              text: "SAVE",
              height: 50,
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textColor: Colors.white,
              buttonColor: Colors.blue,
              borderRadius: 10,
              margin: const EdgeInsets.only(top: 24, bottom: 16),
              horizontalSize: 0.4, // El botón ocupará el 80% del ancho de la pantalla
              onPressed: () async {
                // Tu lógica aquí
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    required TextEditingController controller,
  }) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      keyboardType: keyboardType,
      controller: controller, // Pasa el controlador al TextField
    );
  }
}
//class _HomeState extends State<Home>{
  
  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HEALTH MANAGEMENT",
          style: TextStyle(
            fontSize:20,
            fontWeight: FontWeight.bold,
          ),
          ),
          backgroundColor: Colors.blue,
          elevation: 2,
          centerTitle: true,
           ),
      body: FutureBuilder(
        future: getRegistro(), 
        builder: ((context, snapshot){
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index){
              final userData= snapshot.data?[index];
              if(userData != null){
                return Dismissible(
                  onDismissed: (direction) async{
                    //Se inicializa el widget para llamar a la función deleteRegistro de firebase_servicie.dart
                    
                    await deleteRegistro(userData['uid']);
                  },
                  confirmDismiss: (direction) async {
                    bool result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Confirmar eliminación',style: TextStyle(color: Colors.green)),
                          content: Text('¿Estás seguro de que quieres eliminar el registro de ${userData['name']}?'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
                              onPressed: () => Navigator.pop(context, false),
                            ),
                            TextButton(
                              child: Text('Eliminar'),
                              onPressed: () {
                                Navigator.pop(context, true);
                              }
                            ),
                          ],
                        );
                      },
                    ) ?? false;
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: const Icon(Icons.delete),
                    ),
                  key: Key(snapshot.data?[index]['uid']),
                  child: ListTile(
                     title: Text(userData['name']),subtitle: Text('${userData['lastname']} - ${userData['movil']} - ${userData['email']}'),
                     onTap:(() async{
                      await Navigator.pushNamed(context, "/edit", arguments: {
                        "name": Text(snapshot.data?[index]['name']),
                        "lastname": Text(snapshot.data?[index]['lastname']),
                        "movil": Text(snapshot.data?[index]['movil']),
                        "email": Text(snapshot.data?[index]['email']),
                        "uid": Text(snapshot.data?[index]['uid']),                       
                        });
                        setState(() {});
                     })),
                );
                
              
              } else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            );
        })
        ),

        floatingActionButton: FloatingActionButton(
          onPressed:()async{
            await Navigator.pushNamed(context, "/add");
            setState(() {
              
            });

          },
          child :const Icon(Icons.add),
          ),
    );
   
  }
  
}*/