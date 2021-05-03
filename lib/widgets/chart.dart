import 'package:flutter/material.dart';
import '../models/timechunk.dart';
import './chart_bar.dart';

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
  
  int get maxDuration {
    return groupedChunks.fold(0, (sum, item) {
      return sum + item['duration'];
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    print(groupedChunks);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedChunks.map(
            (chunkData) {
              return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                  chunkData['category'], 
                  chunkData['duration'], 
                  maxDuration == 0 ? 0 : (chunkData['duration'] as int) /maxDuration),
              );
            }
          ).toList(
        ),),
      )
    );
  }
}