import 'package:flutter/material.dart';

class NewTimechunk extends StatefulWidget {
  final Function newTc;

  NewTimechunk(this.newTc);

  @override
  _NewTimechunkState createState() => _NewTimechunkState();
}

class _NewTimechunkState extends State<NewTimechunk> {
  final titleController = TextEditingController();

  final durationController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredDuration = int.parse(durationController.text);

    if (enteredTitle.isEmpty || enteredDuration <= 0){
      return;
    }

    widget.newTc( enteredTitle, enteredDuration );
    Navigator.of(context).pop();
  }

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
                   controller: titleController,
                   onSubmitted: (_) => submitData(),
                 ),
                 TextField(
                    decoration: InputDecoration(
                    labelText: 'Duration'
                   ),
                   controller: durationController,
                   keyboardType: TextInputType.number,
                   onSubmitted: (_) => submitData(),
                 ),
                 FlatButton(
                   child: Text('Add Activity'),
                   textColor: Colors.blue,
                   onPressed: submitData )
               ]
              ),
            ),
          );
  }
}