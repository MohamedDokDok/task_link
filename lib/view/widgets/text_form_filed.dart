import 'package:flutter/material.dart';
import 'package:link_task/shared/app_color/app_color.dart';
import 'package:link_task/shared/app_values.dart';

class MyTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hintLabel;
  final String emptyFiledTitle;
  final Function(String) onChange;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color cursorColor;

  MyTextFormFiled({
    Key? key,
    required this.controller,
    required this.hintLabel,
    required this.emptyFiledTitle,
    required this.onChange,
    this.enabledBorderColor = AppColor.grey,
    this.focusedBorderColor = AppColor.primary,
    this.errorBorderColor = AppColor.error,
    this.cursorColor = AppColor.primary,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 1,
      onChanged: onChange,
      scrollPhysics: const BouncingScrollPhysics(),
      validator: (String? date) {
        if (date!.isEmpty) {
          return emptyFiledTitle;
        } else {
          return null;
        }
      },
      cursorColor: cursorColor,
      keyboardType: TextInputType.name,
      style: const TextStyle(
        color: AppColor.black,
      ),
      decoration: InputDecoration(
        hintText: hintLabel,
        hintStyle: const TextStyle(
          color: AppColor.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: enabledBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedBorderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorBorderColor,
          ),
        ),
      ),
    );
  }
}
