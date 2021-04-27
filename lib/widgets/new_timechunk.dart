import 'package:flutter/material.dart';

class NewTimechunk extends StatelessWidget {
  final Function newTc;
  final titleController = TextEditingController();
  final durationController = TextEditingController();

  NewTimechunk(this.newTc);

  @override
  Widget build(BuildContext context) {
    return Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
               children: <Widget>[
                 TextField(
                   decoration: InputDecoration(
                     labelText: 'Title'
                   ),
                   controller: titleController
                 ),
                 TextField(
                    decoration: InputDecoration(
                     labelText: 'Duration'
                   ),
                   controller: durationController
                 ),
                 FlatButton(
                   child: Text('Add Activity'),
                   textColor: Colors.blue,
                  onPressed: () {
                    newTc(
                      titleController.text, 
                      int.parse(durationController.text)
                      );
                   
                  }
                   )
               ]
              ),
            ),
          );
  }
}