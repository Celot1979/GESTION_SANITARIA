import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/servicies/firebase_servicie.dart';

class Home extends  StatefulWidget{
  const Home({
    super.key,
  });
  @override
  State<Home> createState() => _HomeState(); 
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
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
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                   
                  ),
                  key: Key(snapshot.data?[index]['uid']),
                  child: ListTile(
                     title: Text(userData['name']),subtitle: Text('${userData['lastname']} - ${userData['movil']} - ${userData['email']}'),
                     trailing: IconButton(icon: Icon(Icons.delete),
                     onPressed: () {
                      // Implementación para eliminar el registro
              
                      },
                      ),
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
  
}