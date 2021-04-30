import 'package:flutter/material.dart';
import '../models/timechunk.dart';

class Chart extends StatelessWidget {

  final List<Timechunk> timechunks;
  final List<String> categories;
  
  Chart(this.timechunks, this.categories);

  List<Map<String, Object>> get groupedChunks{
    return List.generate(categories.length, (index) {
      final category = categories[index];
      int durationSum = 0;
      print("we have " + timechunks.length.toString() + " timechunks");
      for(var i = 0; i < timechunks.length; i++){
        if (timechunks[i].category == category) {
          durationSum+= timechunks[i].duration;
        }
      }
      print('category: ' + category);
      print('duration: ' + durationSum.toString());
      return {
        'category' : category,
        'duration' : durationSum
      };
    });
  }
  
  
  
  
  @override
  Widget build(BuildContext context) {
    print(groupedChunks);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(children: <Widget>[

      ])
      
    );
  }
}