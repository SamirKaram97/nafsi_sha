
import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static const String userDataBoxName = 'userDataBox';



  static Future<void> initHiveDB() async {
    await Hive.initFlutter();
    // Hive.registerAdapter(UserLoginDataEntityAdapter());


    await Future.wait([
      // Hive.openBox<UserLoginDataEntity?>(userDataBoxName),
    ]);
  }

  // static Future<void> cacheUserData(UserLoginDataEntity userData) async {
  //   var userDataBox = Hive.box<UserLoginDataEntity?>(userDataBoxName);
  //   await Future.wait([
  //     userDataBox.put('userData', userData),
  //   ]);
  // }

  //
  // static UserLoginDataEntity? getUserData() {
  //   return Hive.box<UserLoginDataEntity?>(userDataBoxName).get('userData');
  // }

  // static Future<void> deleteUserData() async {
  //   var userDataBox = Hive.box<UserLoginDataEntity?>(userDataBoxName);
  //   await Future.wait([
  //     userDataBox.delete('userData'),
  //   ]);
  // }

}
