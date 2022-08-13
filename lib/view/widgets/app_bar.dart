import 'package:flutter/material.dart';
import 'package:link_task/shared/app_color/app_color.dart';
import 'package:link_task/shared/styles/montserrat_style.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final Function()? onPressIcon;
  final IconData? icon;

  const AppBarWidget({Key? key, required this.title, this.onPressIcon, this.icon}) : super(key: key);

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
      actions: [
        IconButton(
          onPressed: onPressIcon,
          icon: Icon(
            icon,
            color: AppColor.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
