import 'package:flutter/material.dart';
import 'widgets/user_timechunks.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

 // String titleInput;
 // String durationInput;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Master'),
      ),
      body: SingleChildScrollView(
              child: Column(
          
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color:Colors.blue,
                child: Text('Chart!'),
                elevation: 5,
              ),
            ),
            UserTimechunks(),
          ],
        ),
      )
    );
  }
}
