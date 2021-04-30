import 'package:flutter/material.dart';
import 'widgets/timechunk_list.dart';
import 'widgets/new_timechunk.dart';
import 'widgets/chart.dart';
import 'models/timechunk.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        accentColor: Colors.cyan,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.blue
          )
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )
          ),
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

 // String titleInput;
 // String durationInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
 final List<Timechunk> _userTimechunks = [
    // Timechunk(
    //   id: 0, 
    //   title: 'Learning Flutter', 
    //   duration: 60, 
    //   start: DateTime.now(),
    //   category: 'skills'),
    // Timechunk(
    //   id: 1, 
    //   title: 'Cleaning Dishes', 
    //   duration: 15, 
    //   start: DateTime.now(),
    //   category: 'chores'),
  ];

  List<Timechunk> get  _recentTimechunks {
    return _userTimechunks.where( (tc) {
      return tc.start.isAfter(DateTime.now().subtract(
        Duration(days: 7)
      ));
    }).toList();
  }

  List<String> categories = [
    'chores',
    'skills',
    'sleep',
    'work',
  ];

  void _addNewTimechunk(String tctitle, int tcduration) {
    final newTimechunk = Timechunk(
      title: 'placeholder', 
      duration : tcduration,
      start: DateTime.now(),
      category: tctitle,
      id: tctitle.hashCode
      );

    setState(() {
      _userTimechunks.add(newTimechunk);
    });
  }
  
  void _startAddNewTimeChunk(BuildContext ctx){
    showModalBottomSheet(
      context: ctx, 
      builder: (_) {
      return GestureDetector(
        onTap: () {},
        child: NewTimechunk(_addNewTimechunk),
        behavior: HitTestBehavior.opaque,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Master'),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () => _startAddNewTimeChunk(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chart(_recentTimechunks, categories),
            TimechunkList(_userTimechunks)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTimeChunk(context),
      ),
    );
  }
}

