import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../shared/app_color/app_color.dart';
import '../../../shared/strings.dart';
import '../../../shared/styles/montserrat_style.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/drawer.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          AppStrings.galleryError.tr(),
          style: getSemiBoldStyle(textColor: AppColor.black),
        ),
    );
  }
}
