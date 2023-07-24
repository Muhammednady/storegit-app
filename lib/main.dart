import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sql.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(   
     
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   SQL sql = SQL();
 
 @override
  Widget build(BuildContext context) {  

    [1,2,3].map((e) => e.toDouble())  ;
  
    return Scaffold(
      appBar:AppBar(title: Text("${widget.title}"),),
      body:Column(children: [
        Center(child: ElevatedButton(onPressed:()async{
           int res = await sql.writeData("INSERT INTO 'notes' ('note') VALUES ('NOTE ONE') ");
            print(res);
        }, child:Text("Insert Data"))),

        ElevatedButton(onPressed: ()async{
             List<Map> res = await sql.readData("SELECT * FROM notes");
            print(res);
        }, child:Text("Read Data")),

        ElevatedButton(onPressed: ()async{
           int res = await sql.deleteData("DELETE FROM notes WHERE id = 5 ");
            print(res);

        }, child:Text("Delete Data")),

        ElevatedButton(onPressed: ()async{
            int res = await sql.updateData("UPDATE notes SET 'note'='note five' WHERE id = 5 ");
            print(res);
        }, child:Text("Update Data")),
      ],)
      );
  }
}