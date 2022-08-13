import 'package:flutter/material.dart';

import '../../shared/app_color/app_color.dart';
import '../../shared/app_values.dart';
import '../../shared/styles/montserrat_style.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final String imgPath;
  const ListTileWidget
      ({Key? key, required this.title, required this.onTap, required this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      contentPadding: const EdgeInsets.symmetric(vertical: AppPadding.p5),
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: AppPadding.p30),
        child: Image.asset(
          imgPath,
          color: AppColor.black,
        ),
      ),
      title: Text(
        title,
        style: getMediumStyle(textColor: AppColor.black, fontSize: 14.0),
      ),
    );
  }
}
