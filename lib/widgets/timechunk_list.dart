import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/timechunk.dart';



class TimechunkList  extends StatelessWidget {
  final List<Timechunk> timechunks;

  TimechunkList(this.timechunks);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
               child: Row(children: <Widget> [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10, 
                      horizontal: 15),
                    decoration: BoxDecoration(border: Border.all(
                      color: Colors.deepPurple,
                      width: 2,
                    )),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '${timechunks[index].duration} min',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepPurple,
                        )
                  )
                 ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      timechunks[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.blue
                      )),
                    Text(
                      DateFormat.yMd().add_jm().format(timechunks[index].start),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                      ))
                  ]
                )
               ])
             );
        },
        itemCount: timechunks.length,
      ),
    );
  }
}