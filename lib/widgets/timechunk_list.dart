import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/timechunk.dart';



class TimechunkList extends StatelessWidget {
  final List < Timechunk > timechunks;
  final Function deleteTimeChunk;
  TimechunkList(this.timechunks, this.deleteTimeChunk);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: timechunks.isEmpty ?
      Column(
        children: < Widget > [
          Text(
            'No time recorded yet!',
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(height: 20, ),
          Container(
            height: 200,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover)
          ),
        ],
      ) :
      ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('${timechunks[index].duration} min'),
                  ),
                )
              ),
              title: Text(
                timechunks[index].category,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(
                DateFormat.yMd().add_jm().format(timechunks[index].start),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTimeChunk(timechunks[index].id),
                ),
              
            ),
          );

        },
        itemCount: timechunks.length,
      ),
    );
  }
}