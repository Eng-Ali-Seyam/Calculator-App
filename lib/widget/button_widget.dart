
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../getx/theme_getx_controller.dart';

class MyButton extends StatelessWidget {
   const MyButton({Key? key,required this.text, this.inSide=false,}) : super(key: key);
  final String text ;
  final bool inSide;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor(text),
      radius: 30.r,
      child: text == 'b' ? Icon(Icons.backspace_outlined,color: Color(0xFFDFA813),):
          text == '^'?Icon(Icons.expand_less_sharp,color: Color(0xFFDFA813),size: 36,):
      Text(text,style: TextStyle(
          fontSize: 36.sp,
        fontFamily: 'BalooBhaijaan2',
        color: textColor(text)
      ),),
    );
  }
  Color textColor(String text){
    if(text=="C"){
      return Color(0xFFf87110);
    }else if(inSide){
      return Color(0xFFf0b410);
    }
    return ThemeControlller.to.darkType ? Colors.white : Colors.black;
  }

  Color backgroundColor(String text){
    if(inSide){
      return ThemeControlller.to.darkType? Color(0xFF3c3d4f) : Color(0xFFeeeeee);
    }else if(text=="="){
      return Color(0xFFf0b410);
    }
    return ThemeControlller.to.darkType ? Color(0xFF2e2f3e) :Color(0x57999999);
  }
}
