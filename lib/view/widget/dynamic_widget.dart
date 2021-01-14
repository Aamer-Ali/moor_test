import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moor_test/controller/dynamic_widget_controller.dart';

class dynamicWidget extends StatelessWidget {
  TextEditingController Url = new TextEditingController();

  final int index;
  final Function(dynamicWidget) removeServiceCard;

  dynamicWidget (this.removeServiceCard, {Key key, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListBody(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 200,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: new TextFormField(
                  controller: Url,
                  decoration: const InputDecoration(
                    labelText: 'Url',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  print('Remove');
                  removeServiceCard(this);
                },
                child: Text("Remove"),
              )
            ],
          )
        ],
      ),
    );
  }
}
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moor_test/controller/dynamic_widget_controller.dart';
//
// class dynamicWidget extends StatelessWidget {
//   DynamicWidgetController controller = Get.find<DynamicWidgetController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListBody(
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Container(
//                 width: 200,
//                 padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
//                 child: new TextFormField(
//                   onChanged: (value) {
//                     controller.url.value = value;
//                   },
//                   decoration: const InputDecoration(
//                     labelText: 'Url',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               RaisedButton(
//                 onPressed: () {
//                   print('Remove');
//                 },
//                 child: Text("Remove"),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }