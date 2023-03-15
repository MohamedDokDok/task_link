import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:link_task/view/widgets/button.dart';
import 'package:link_task/view_model/articles_cubit/articles_cubit.dart';
import '../../../shared/app_color/app_color.dart';

import '../../../shared/app_fonts.dart';
import '../../../shared/app_values.dart';
import '../../../shared/assets_manager/images_manager.dart';
import '../../../shared/strings.dart';
import '../../../shared/styles/montserrat_style.dart';

class NoInternetBody extends StatelessWidget {
  const NoInternetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SvgPicture.asset(
                  ImagesManager.noConnection,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText(AppStrings.noInternet.tr(),
                        textStyle: getBoldStyle(
                            textColor: AppColor.error,
                            fontSize: FontsSizeManager.s16)),
                    RotateAnimatedText(AppStrings.checkInternet.tr(),
                        textStyle: getMediumStyle(
                            textColor: AppColor.black,
                            fontSize: FontsSizeManager.s14)),
                  ],
                  isRepeatingAnimation: true,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
