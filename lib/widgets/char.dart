import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  
  List<Map<String, Object>> get groupedChunks{
    return List.generate(6, (index) {
      return {};
    });
  }
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(children: <Widget>[

      ])
      
    );
  }
}