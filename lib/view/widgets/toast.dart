import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:link_task/shared/app_color/app_color.dart';
import 'package:link_task/shared/app_fonts.dart';
import 'package:link_task/shared/constants.dart';

import '../../shared/enum_generation.dart';

void showToast({
  required String text,
  required ToastStates state
})=>Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: AppConstants.toastDelay,
    backgroundColor: chooseToastColor(state),
    textColor: AppColor.white,
    fontSize: FontsSizeManager.s16
);

Color chooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color=AppColor.green;
      break;
    case ToastStates.ERROR:
      color=AppColor.error;
      break;
    case ToastStates.WARNING:
      color=AppColor.yellow;
      break;
  }
  return color;
}