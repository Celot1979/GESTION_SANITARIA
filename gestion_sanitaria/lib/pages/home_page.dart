import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/servicies/firebase_servicie.dart';
import 'package:gestion_sanitaria/widgets/custom_app_bar.dart';

class HomeRead extends  StatefulWidget{
  const HomeRead({
    super.key,
  });
  @override
  State<HomeRead> createState() => _HomeReadState(); 
}

class _HomeReadState extends State<HomeRead>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: const CustomAppBar(
        title: "HEALTH MANAGEMENT",
        subtitle: "Workers registered in the system", imageUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png', linkUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png',
         titleStyle: TextStyle(fontSize: 24),
        subtitleStyle: TextStyle(fontSize: 16),
      ),
      
      body: FutureBuilder(
        future: getRegistro(), 
        builder: ((context, snapshot){
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index){
              final userData= snapshot.data?[index];
              if(userData != null){
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  elevation: 4,
                  child: Dismissible(
                    onDismissed: (direction) async{
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
                                child: const Text('Eliminar'),
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
                    child: MouseRegion(
                      onEnter: (_) => setState(() {
                        userData['hover'] = true;
                      }),
                      onExit: (_) => setState(() {
                        userData['hover'] = false;
                      }),
                      child: ListTile(
                        selectedTileColor: Colors.blue,
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text(userData['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${userData['lastname']} - ${userData['movil']} - ${userData['email']}'),
                        onTap:(() async{
                          await Navigator.pushNamed(context, "/edit", arguments: {
                            "name": Text(snapshot.data?[index]['name']),
                            "lastname": Text(snapshot.data?[index]['lastname']),
                            "movil": Text(snapshot.data?[index]['movil']),
                            "email": Text(snapshot.data?[index]['email']),
                            "uid": Text(snapshot.data?[index]['uid']),                       
                          });
                          setState(() {});
                        }),
                      ),
                    ),
                  ),
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
            await Navigator.pushNamed(context, "/");
            setState(() {
              
            });

          },
          child: const Icon(Icons.home, color: Colors.blue),
        ),
    );
   
  }
  
}