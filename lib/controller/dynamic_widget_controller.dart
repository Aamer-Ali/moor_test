import 'package:get/get.dart';
import 'package:moor_test/view/widget/dynamic_widget.dart';

class DynamicWidgetController extends GetxController {
  var dynamicList = List<dynamicWidget>().obs;

  List<String> urls = List<String>().obs;

  var url = "".toString().obs;
}
