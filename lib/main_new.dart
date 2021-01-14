// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moor_test/controller/dynamic_widget_controller.dart';
// import 'package:moor_test/data/moor_database.dart';
// import 'package:moor_test/view/widget/dynamic_widget.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   DynamicWidgetController controller = Get.put(DynamicWidgetController());
//
//   @override
//   Widget build(BuildContext context) {
//     controller.dynamicList.add(dynamicWidget());
//     controller.dynamicList.add(dynamicWidget());
//     controller.dynamicList.add(dynamicWidget());
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
//           child: Column(
//             children: [
//               RaisedButton(
//                 onPressed: () {
//                   controller.dynamicList.add(dynamicWidget());
//                 },
//                 child: Text("Add Widget"),
//               ),
//               // for (var item in dynamicList) item,
//               Container(
//                   height: MediaQuery.of(context).size.height / 1.5,
//                   child: Obx(
//                     () => ListView.builder(
//                         itemCount: controller.dynamicList.length,
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             child: controller.dynamicList[index],
//                             onTap: () {},
//                           );
//                         }),
//                   )),
//               RaisedButton(
//                 onPressed: () {
//                   var Url = [];
//                   controller.dynamicList.forEach((widget) => Url.add(controller.url));
//                   // Url.add(controller.url);
//                   for (var item in Url) {
//                     print(item);
//                   }
//                 },
//                 child: Text("Submit Form"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
