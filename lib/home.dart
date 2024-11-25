import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var notesController=TextEditingController();
    CollectionReference notes=FirebaseFirestore.instance.collection("notes");
    return  Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(stream: notes.snapshots(),
             builder: (context,snapshot){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                return Text(snapshot.data!.docs[index]["subject"]);
              },
              );
             },
             ),
          ),
      
           TextField(
          controller: notesController,
        ),
        ElevatedButton(onPressed: (){
          notes.add({"subject":notesController.text,"title":"test"});
        }, child: Text("add"))],
      ),
    );
  }
}