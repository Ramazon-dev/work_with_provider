import 'package:dars77_provider_with_traffick_lights/model/list.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String valueOfColor = "red";
  Color colorOfAppBar = Colors.red;
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController textController = TextEditingController();
  List<MyList> myList = [];

  void changeColor(String newCOlor) {
    valueOfColor = newCOlor;
    if (valueOfColor == "red") {
      colorOfAppBar = Colors.red;
    } else if (valueOfColor == "yellow") {
      colorOfAppBar = Colors.yellow;
    } else {
      colorOfAppBar = Colors.green;
    }

    notifyListeners();
  }

  void addToList(MyList ml) {
    if (formKey.currentState!.validate()) {
      myList.add(ml);
      textController.clear();
      notifyListeners();
    }
  }
}
