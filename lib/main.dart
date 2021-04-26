import 'package:flutter/material.dart';
import './timechunk.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
final List<Timechunk> justalist = [ Timechunk(
      id: 0, 
      title: 'Learning Flutter', 
      duration: 60, 
      start: DateTime.now(),
      category: 'skills')
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Master'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color:Colors.blue,
              child: Text('Chart!'),
              elevation: 5,
            ),
          ),
          Card(
            color: Colors.teal,
            child: Text('Main card')
          )
        ],
      )
    );
  }
}
