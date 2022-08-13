import 'package:flutter/material.dart';

import '../../../shared/app_color/app_color.dart';
import '../../../shared/strings.dart';
import '../../../shared/styles/montserrat_style.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/drawer.dart';

class ExploreOnlineNewsScreen extends StatelessWidget {
  const ExploreOnlineNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          AppStrings.liveChatError,
          style: getSemiBoldStyle(textColor: AppColor.black),
        ),
    );
  }
}
