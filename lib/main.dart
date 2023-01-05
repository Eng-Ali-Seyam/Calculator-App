import 'package:calculator_app/getx/button_getx_controller.dart';
import 'package:calculator_app/getx/theme_getx_controller.dart';
import 'package:calculator_app/pref/shared_pref_controller.dart';
import 'package:calculator_app/screens/app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  ThemeControlller themeControlller =Get.put(ThemeControlller());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 838),
      builder: (context, child) {
        return GetBuilder<ThemeControlller>(
          builder: (controller) {
            return MaterialApp(
              themeMode:ThemeMode.system,
              debugShowCheckedModeBanner: false,
              initialRoute: '/home_screen',
              routes: {
                '/home_screen' : (context) =>  HomeScreen(),
              },
            );
          },
        );
      },
    );
  }
}

