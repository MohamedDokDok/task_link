import 'package:flutter/material.dart';
import 'package:link_task/shared/app_color/app_color.dart';
import 'package:link_task/shared/app_values.dart';
import 'package:link_task/shared/styles/montserrat_style.dart';
import 'package:link_task/view/widgets/text_form_filed.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actionsWidgets;

  AppBarWidget({Key? key, required this.title, this.actionsWidgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title.toUpperCase(),
        style: getBoldStyle(
          textColor: AppColor.white,
          fontSize: 14.0,
        ),
      ),
      centerTitle: false,
      actions: actionsWidgets,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
