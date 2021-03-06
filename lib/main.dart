import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

 void main () {
   runApp(MaterialApp(
     home: Home(),
   ));
 }
 class Home extends StatefulWidget {
   @override
   _HomeState createState() => _HomeState();
 }
 
 class _HomeState extends State<Home> {
   List _toDoList = [];
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("lista de tarefas"),
         backgroundColor: Colors.blueAccent,
         centerTitle: true,
       ),
       body: Column(
         children: <Widget>[
           Container(
             padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
             child: Row(
               children:<Widget> [
                 TextField(
                   decoration: InputDecoration(
                     labelText: "nova Tarefa",
                     labelStyle: TextStyle(color: Colors.blueAccent)
                   ),
                 ),
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     textStyle: TextStyle(
                       color: Colors.white,
                     ),
                   //  color: Colors.blueAccent,
                   ),

                   child: Text("ADD"),

                     onPressed:(){},
                 )
               ],
             ),
           )
         ],
       ),
     );
   }
   Future<File> _getFile() async {
     final directory = await getApplicationDocumentsDirectory();
     return File("${directory.path}/data.json");
   }

   Future<File> _saveData() async {
     String data = json.encode(_toDoList);
     final file = await _getFile();
     return file.writeAsString(data);
   }
   Future<String> _readData() async{
     try{
       final file = await _getFile();
     } catch (e) {
       return null;
     }
   }

 }


