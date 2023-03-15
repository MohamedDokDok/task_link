import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:link_task/view/widgets/app_bar.dart';
import 'package:link_task/view/widgets/button.dart';
import 'package:link_task/view/widgets/card_view.dart';
import 'package:link_task/view_model/articles_cubit/articles_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/app_color/app_color.dart';
import '../../../shared/app_values.dart';
import '../../../shared/enum_generation.dart';
import '../../../shared/strings.dart';
import '../../../shared/styles/montserrat_style.dart';
import '../../widgets/toast.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  final String title;
  final String imgURL;
  final String date;
  final String articleDescription;
  final String articleUrl;
  final String publisher;
  const ArticlesDetailsScreen({
    Key? key,
    required this.title,
    required this.imgURL,
    required this.articleDescription,
    required this.articleUrl,
    required this.publisher,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarWidget(
        title: "articles details",
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: CardView(
                  imgURL: imgURL,
                  title: title,
                  publisher: publisher,
                  date: date,
                  articleUrl: articleUrl,
                  articleDescription: articleDescription,
                  isArticleDetails: true,
                ),
              ),
            ),
            DefaultButtonWidget(
              label: AppStrings.openWebSite.tr(),
              onPressed: () async {
                print(articleUrl);
                final Uri _url = Uri.parse(articleUrl);
                _launchURL(url: _url);
              },
              isExpanded: true,
              context: context,
            )
          ],
        ),
      ),
    );
  }

  void _launchURL({required Uri url}) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      showToast(
        text: AppStrings.canNotOpenUrl.tr(),
        state: ToastStates.ERROR,
      );
    }
  }
}
