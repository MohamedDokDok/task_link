import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:link_task/shared/app_color/app_color.dart';
import 'package:link_task/shared/strings.dart';
import 'package:link_task/shared/styles/montserrat_style.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/drawer.dart';

class LiveChatScreen extends StatelessWidget {
  const LiveChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          AppStrings.liveChatError.tr(),
          style: getSemiBoldStyle(textColor: AppColor.black),
        ),
    );
  }
}
