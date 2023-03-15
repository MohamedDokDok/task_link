import 'package:flutter/material.dart';
import 'package:link_task/view/widgets/app_bar.dart';
import 'package:link_task/view/widgets/card_view.dart';
import 'package:link_task/view/widgets/drawer.dart';

import '../../shared/app_color/app_color.dart';
import '../../shared/app_values.dart';
import '../widgets/text_form_filed.dart';

class ArticleScreenForWindows extends StatelessWidget {
  TextEditingController txtSearchController = TextEditingController();

  ArticleScreenForWindows({Key? key}) : super(key: key);

  _appBarWiget() => AppBarWidget(
        title: "ArticlesArticlesArticles",
        actionsWidgets: [
          SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: AppPadding.p5, end: AppPadding.p14),
              child: MyTextFormFiled(
                controller: txtSearchController,
                hintLabel: "Search",
                emptyFiledTitle: "emptyFiledTitle",
                cursorColor: AppColor.white,
                enabledBorderColor: AppColor.black,
                focusedBorderColor: AppColor.white,
                errorBorderColor: AppColor.error,
                onChange: (String? value) {},
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColor.white,
              ))
        ],
      );

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: _appBarWiget(),
      body: Row(
        children: [
        Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CardView(imgURL: "", title: "isj olaj pohjdo", publisher: "pjdpoa", date: "${DateTime.now()}", articleUrl: "articleUrl", articleDescription: "articleDescription"),
                  separatorBuilder: (context, index) => const SizedBox(width: 41,),
                  itemCount: 20))
        ],
      ),
    );
  }
}
