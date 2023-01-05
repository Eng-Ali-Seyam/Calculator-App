import 'package:calculator_app/pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeControlller extends GetxController {

  RxBool dark =true.obs;
  void changeTheme(bool value){
    dark.value = value ;
    SharedPrefController().saveTheme(value);
  }

  bool get darkType{
    return SharedPrefController().getValueFor<bool>(key: PrefKeys.isDark.name)??true ;
  }

  static ThemeControlller get to => Get.find();
}
