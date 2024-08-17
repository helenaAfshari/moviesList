


//جلوگیری از کال شدن api های اضافه برای سرچ بار 
//بهینه کردن سرچ بار 
import 'dart:async';
import 'package:flutter/material.dart';

class DBouncer {
  final int milliseconds;
  Timer? timer;
  DBouncer({required this.milliseconds});

  void run(VoidCallback action){
    if(timer != null){
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void reset(){
    timer = null;
  }
  
}