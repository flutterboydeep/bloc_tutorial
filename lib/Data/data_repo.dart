// import 'dart:developer';

import 'package:learn_bloc/bloc/todoListEvent.dart';

class DataRepo {
  // final eventList;

  List<String> ListData = [];
  AddDatarepoFun(event) {
    print("the value of event is $event in repo");
    ListData.add(event.title);
    print("this is Data $ListData");
    return ListData;
  }

  // Future<XFile?> UseGallery() async {
  //   try {
  //     XFile? file = await _picker.pickImage(source: ImageSource.gallery);
  //     return file;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
}
