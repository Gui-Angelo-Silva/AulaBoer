import 'package:flutter/material.dart';
import 'package:appcrudsqlite/screens/add.dart';
import 'package:appcrudsqlite/screens/list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppCrudSQLITE" ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(20),
        child: Column(children: [
          SizedBox(height: 200),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return Add();
              }));
            },
            child: Text("Adicionar"),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              //Navigator.push(context,
                  //MaterialPageRoute(builder: (BuildContext context) {
                //return ListBooks();
              //}));
            },
            child: Text("Listar"),
          ),
        ]),
      ),
    );
  }
}
