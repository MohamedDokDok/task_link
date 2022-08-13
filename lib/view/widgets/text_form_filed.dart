

import 'package:flutter/material.dart';
import 'package:link_task/shared/app_color/app_color.dart';
import 'package:link_task/shared/app_values.dart';

class MyTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hintLabel;
  final String emptyFiledTitle;
  final Function(String) onChange;

  const MyTextFormFiled({
    Key? key,
    required this.controller,
    required this.hintLabel,
    required this.emptyFiledTitle,
    required this.onChange,
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
      cursorColor: AppColor.primary,
      keyboardType: TextInputType.name,
      style:  TextStyle(
        color: AppColor.black,
      ),
      decoration: InputDecoration(
        hintText: hintLabel,
        hintStyle: TextStyle(
            color: AppColor.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
          borderSide: BorderSide(
            color: AppColor.grey,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
          borderSide: const BorderSide(
            color: AppColor.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
          borderSide: BorderSide(
            color: AppColor.error,
          ),
        ),
      ),
    );
  }
}
