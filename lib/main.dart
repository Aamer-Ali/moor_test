import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moor_test/controller/dynamic_widget_controller.dart';
import 'package:moor_test/data/moor_database.dart';
import 'package:moor_test/view/widget/dynamic_widget.dart';

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

  // Column someColumn = Column(
  //   children: [],
  // );

  DynamicWidgetController controller = Get.put(DynamicWidgetController());

  var dynamicList = List<dynamicWidget>();

  void removeServiceCard(index) {
    setState(() {
      dynamicList.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    // dynamicList.add(dynamicWidget(removeServiceCard,index: 1,));
    // dynamicList.add(dynamicWidget(removeServiceCard,index: 2,));
    // dynamicList.add(dynamicWidget(removeServiceCard,index: 3,));

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    // someColumn.children.add(Text("Hello"));
                    dynamicList.add(dynamicWidget(removeServiceCard,index: dynamicList.length,));
                  });
                },
                child: Text("Add Widget"),
              ),
              // for (var item in dynamicList) item,
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: ListView.builder(
                    itemCount: dynamicList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: dynamicList[index],
                        onTap: () {},
                      );
                    }),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    var Url = [];
                    dynamicList.forEach((widget) => Url.add(widget.Url.text));
                    setState(() {});
                    print(Url.length);
                    for (var item in Url) {
                      print(item);
                    }
                  });
                },
                child: Text("Submit Form"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
