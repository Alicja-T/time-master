import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTimechunk extends StatefulWidget {
  final Function newTc;

  NewTimechunk(this.newTc);

  @override
  _NewTimechunkState createState() => _NewTimechunkState();
}

class _NewTimechunkState extends State < NewTimechunk > {
  final _titleController = TextEditingController();
  final _durationController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredDuration = int.parse(_durationController.text);

    if (enteredTitle.isEmpty || enteredDuration <= 0) {
      return;
    }

    widget.newTc(enteredTitle, enteredDuration);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2020), 
      lastDate: DateTime.now()
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: < Widget > [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Category'
                ),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Duration'
                ),
                controller: _durationController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(children: < Widget > [
                  Expanded(
                    child: Text(_selectedDate == null ? 
                    'No Date Chosen' : 
                    DateFormat.yMd().format(_selectedDate)),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date', style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: _presentDatePicker,
                  )
                ]),
              ),
              RaisedButton(
                child: Text('Add Activity'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitData)
            ]
          ),
        ),
      ),
    );
  }
}