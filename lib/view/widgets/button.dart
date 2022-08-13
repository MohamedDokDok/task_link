
import 'package:flutter/material.dart';
import 'package:link_task/shared/app_values.dart';
import 'package:link_task/shared/styles/montserrat_style.dart';

import '../../shared/app_color/app_color.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double height;
  final double width;
  final bool isExpanded;
  final Color color;
  BuildContext context;

  DefaultButtonWidget(
      {Key? key, required this.label,
        required this.onPressed,
        required this.isExpanded,
        this.height = 65,
        this.width = 202,
        this.color = AppColor.primary,
        required this.context,
        }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpanded ? double.infinity : width,
      height: height,
      color: color,
      child: MaterialButton(
        minWidth: 0,
        padding: EdgeInsets.zero,
        onPressed: () {
          onPressed();
        },
        child: Text(
          label,
          style: getMediumStyle(textColor: Colors.white),
        ),
      ),
    );
  }
}
