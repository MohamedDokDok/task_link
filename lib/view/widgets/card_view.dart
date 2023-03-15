import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:link_task/shared/app_fonts.dart';
import 'package:link_task/shared/routes/routes_strings.dart';
import 'package:link_task/shared/strings.dart';
import 'package:link_task/view/screens/articles_details/articles_details.dart';

import '../../shared/app_color/app_color.dart';
import '../../shared/app_values.dart';
import '../../shared/styles/montserrat_style.dart';

class CardView extends StatelessWidget {
  final String imgURL;
  final String articleUrl;
  final String articleDescription;
  final String title;
  final String publisher;
  final String date;
  final bool isArticleDetails;
  const CardView({
    Key? key,
    required this.imgURL,
    required this.title,
    required this.publisher,
    required this.date,
    required this.articleUrl,
    required this.articleDescription,
    this.isArticleDetails = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isArticleDetails? null :() {

        Navigator.pushNamed(context, AppRoutes.articlesDetailsRoute,
            arguments: ArticlesDetailsScreen(
              title: title,
              articleUrl: articleUrl,
              imgURL: imgURL,
              publisher: publisher,
              articleDescription: articleDescription,
              date: date,
            ));
      },
      child: Card(
        color: AppColor.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CachedNetworkImage(
                  imageUrl: imgURL,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Column(
                      children: [
                        const Icon(Icons.error),
                        Text(
                          AppStrings.imageGetFailed.tr(),
                          style: getBoldStyle(
                              textColor: AppColor.error, fontSize: FontsSizeManager.s16),
                        )
                      ],
                    ),
                  ),
                ),
                if(isArticleDetails)
                  Text(
                    DateFormat.MMMEd().format(DateTime.parse(date)),
                    style: getRegularStyle(
                      textColor: AppColor.white,
                      fontSize: FontsSizeManager.s14
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: getBoldStyle(
                      textColor: AppColor.black,
                    ),
                  ),
                  const SizedBox(
                    height: AppPadding.p5,
                  ),
                  Text(
                    "By $publisher",
                    style: getRegularStyle(
                      textColor: AppColor.black,
                    ),
                  ),
                  if(!isArticleDetails)
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Text(
                      DateFormat.MMMEd().format(DateTime.parse(date)),
                      style: getRegularStyle(
                        textColor: AppColor.black,
                      ),
                    ),
                  ),
                  if(isArticleDetails)
                    Text(
                      articleDescription,
                      style: getMediumStyle(textColor: AppColor.grey1,fontSize: FontsSizeManager.s14),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
