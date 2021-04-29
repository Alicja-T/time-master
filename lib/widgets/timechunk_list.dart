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
      child: timechunks.isEmpty
      ? Column(
        children: <Widget> [
          Text(
            'No time recorded yet!',
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(height: 20,),
          Container(
            height: 200,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover)
            ),
        ],
      ) 
      : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
               child: Row(children: <Widget> [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10, 
                      horizontal: 15),
                    decoration: BoxDecoration(border: Border.all(
                      color: Theme.of(context).primaryColorDark,
                      width: 2,
                    )),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '${timechunks[index].duration} min',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColorDark,
                        )
                  )
                 ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      timechunks[index].title,
                      style: Theme.of(context).textTheme.title, 
                    ),
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