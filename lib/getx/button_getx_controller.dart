
import 'package:calculator_app/utils/utils.dart';
import 'package:function_tree/function_tree.dart';
import 'package:get/get.dart';
class ButtonGetxController extends GetxController{

  String equation = '' ;
  dynamic result =0;
  RxBool resultNotShow = true.obs ;

  void addToEquation(String button,bool append){

    if (append) {
      resultNotShow.value =false ;
      if(Utils.isOperatorAtEnd(equation)&&Utils.isOperator(button)){
        equation = equation.length == 1 ? equation:equation.substring(0,equation.length-1);
      }
      equation= equation=='0' ? button:equation+button;
      showResult();
    }else if(button=='='){
      equation=result.toString();
      resultNotShow.value = true;
    }else if(button=='C'){
      equation='0';
      result=0;
    }else if(button == 'b'){
      delete();
    }
    update();
  }

  void showResult(){
    if(result is String){
      equation ='0' ;
    }
    String eq=equation ;
    if (Utils.isOperatorAtEnd(equation)) {
      eq=equation.length == 1 ?'0':equation.substring(0,equation.length-1);
    }

    if(Utils.isOperator(eq[0])){
      if(eq.length>1){
        eq=equation.substring(1,equation.length);
      }else{
        eq='0';
      }

    }

    double myDouble =eq.replaceAll('x', '*').replaceAll('÷', '/').replaceAll('–', '-').interpret().toDouble();

    if(myDouble.isInfinite){
     result ='infinite' ;
    }else{
      double fraction = myDouble - myDouble.truncate();
      if(fraction==0){
        result = myDouble.toInt();
      }else{
        result = myDouble ;
      }
    }
    update();
  }

  void delete(){
    if(result is String){
      equation ='0' ;
    }
    equation =equation.length == 1 ?'0':equation.substring(0,equation.length-1);
    showResult();
    update();
  }

}