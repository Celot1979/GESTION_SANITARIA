import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gestion_sanitaria/servicies/firebase_servicie.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends  StatefulWidget{

  const Home({
    Key? key,

  }) : super(key: key);
  
  @override
  State<Home> createState() => _HomeState(); 
  
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestión sanitaria"),
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
    );
   
  }


}