import 'package:calculator_app/getx/button_getx_controller.dart';
import 'package:calculator_app/getx/theme_getx_controller.dart';
import 'package:calculator_app/models/button_model.dart';
import 'package:calculator_app/pref/shared_pref_controller.dart';
import 'package:calculator_app/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ButtonModel> _buttons = <ButtonModel>[
    ButtonModel(text: 'C', inSide: true, shouldAppend: false),
    ButtonModel(text: '÷', inSide: true),
    ButtonModel(text: 'x', inSide: true),
    ButtonModel(text: 'b', inSide: true, shouldAppend: false),
    ButtonModel(text: '7'),
    ButtonModel(text: '8'),
    ButtonModel(text: '9'),
    ButtonModel(text: '–', inSide: true),
    ButtonModel(text: '4'),
    ButtonModel(text: '5'),
    ButtonModel(text: '6'),
    ButtonModel(text: '+', inSide: true),
    ButtonModel(text: '1'),
    ButtonModel(text: '2'),
    ButtonModel(text: '3'),
    ButtonModel(text: '^', inSide: true),
    ButtonModel(text: '.'),
    ButtonModel(text: '0'),
    ButtonModel(text: '%'),
    ButtonModel(text: '=', shouldAppend: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              ThemeControlller.to.changeTheme(!ThemeControlller.to.dark.value);
            });
          },
          icon: Icon(
            ThemeControlller.to.darkType
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
            color: ThemeControlller.to.darkType? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor:
          ThemeControlller.to.darkType ? Color(0xFF242530) : Colors.white,
      body: GetBuilder<ButtonGetxController>(
        init: ButtonGetxController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 80.h,
                  alignment: Alignment.centerRight,
                  child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            controller.equation,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ThemeControlller.to.darkType
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 48.sp,
                              height: 1.h,
                              fontFamily: 'BalooBhaijaan2',
                            ),
                          )
                        ],
                      )),
                ),
                Visibility(
                  visible: controller.resultNotShow.isFalse,
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  child: Text(
                    controller.result.toString(),
                    style: TextStyle(
                        color: Color(0xFFdfa813),
                        fontSize: 24.sp,
                        fontFamily: 'BalooBhaijaan2'),
                  ),
                ),

                Divider(
                  color: Color(0xFF3c3d4f),
                  thickness: 1,
                  height: 40.h,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.zero,
                    child: Align(
                      // alignment: AlignmentDirectional.center,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _buttons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 50.w / 50.h,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.addToEquation(_buttons[index].text,
                                  _buttons[index].shouldAppend);
                            },
                            child: MyButton(
                              text: _buttons[index].text,
                              inSide: _buttons[index].inSide,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
