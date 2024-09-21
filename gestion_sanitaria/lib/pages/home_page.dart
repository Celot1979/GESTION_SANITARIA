
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
                return ListTile(
                   title: Text(userData['name']),subtitle: Text('${userData['lastname']} - ${userData['movil']} - ${userData['email']}'),
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
          onPressed:(){
            Navigator.pushNamed(context, "/add");

          },
          child :const Icon(Icons.add),
          ),
    );
   
  }
  
}