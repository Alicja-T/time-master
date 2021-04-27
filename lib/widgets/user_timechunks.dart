import 'package:flutter/material.dart';
import 'new_timechunk.dart';
import 'timechunk_list.dart';
import '../models/timechunk.dart';
 class UserTimechunks extends StatefulWidget {
  @override
  _UserTimechunksState createState() => _UserTimechunksState();
}

class _UserTimechunksState extends State<UserTimechunks> {
final List<Timechunk> _userTimechunks = [
    Timechunk(
      id: 0, 
      title: 'Learning Flutter', 
      duration: 60, 
      start: DateTime.now(),
      category: 'skills'),
    Timechunk(
      id: 1, 
      title: 'Cleaning Dishes', 
      duration: 15, 
      start: DateTime.now(),
      category: 'chores'),
  ];

  void _addNewTimechunk(String tctitle, int tcduration) {
    final newTimechunk = Timechunk(
      title: tctitle, 
      duration : tcduration,
      start: DateTime.now(),
      category: 'TO_DO',
      id: tctitle.hashCode
      );

    setState(() {
      _userTimechunks.add(newTimechunk);
    });

  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          NewTimechunk(_addNewTimechunk),

          TimechunkList(_userTimechunks),
      ]
    );
  }
}