import 'package:flutter/material.dart';
import 'package:moor_test/data/moor_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<dynamicWidget> dynamicList = [];
  // List<String> Price = [];
  // List<String> Product = [];
  //
  Column someColumn = Column(
    children: [],
  );

  var dynamicList = List<Widget>();

  @override
  Widget build(BuildContext context) {
    someColumn.children.add(dynamicWidget());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
          child: Center(
            child: Column(
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      // someColumn.children.add(Text("Hello"));
                      dynamicList.add(dynamicWidget());
                    });
                  },
                  child: Text("Add Widget"),
                ),
                for(var item in dynamicList) item,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class dynamicWidget extends StatelessWidget {
  TextEditingController Product = new TextEditingController();
  TextEditingController Price = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListBody(
        children: <Widget>[
          Row(
            children: <Widget>[

            ],
          )
        ],
      ),
    );
  }
}
