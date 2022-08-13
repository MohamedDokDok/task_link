import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_task/data/models/articles.dart';
import 'package:link_task/data/models/articles.dart';
import 'package:link_task/view_model/articles_cubit/articles_cubit.dart';

import '../../shared/app_color/app_color.dart';
import '../../shared/app_values.dart';
import '../../shared/assets_manager/images_manager.dart';
import '../../shared/routes/routes_strings.dart';
import '../../shared/strings.dart';
import '../../shared/styles/montserrat_style.dart';
import 'list_tile.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        ArticlesCubit cubit = ArticlesCubit.get(context);
        return Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0,
                        color: AppColor.white,
                      ),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(ImagesManager.profile),
                          radius: AppSize.s30,
                        ),
                        const SizedBox(
                          width: AppPadding.p12,
                        ),
                        Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.welcome,
                                  style: getRegularStyle(
                                      textColor: AppColor.grey),
                                ),
                                Text(
                                  AppStrings.name,
                                  style: getSemiBoldStyle(
                                      textColor: AppColor.black,
                                      fontSize: 16.0),
                                ),
                              ],
                            ))
                      ],
                    )),
                ListTileWidget(
                  title: AppStrings.articles,
                  onTap: () {
                    cubit.changeIndex(index: 0);
                    Navigator.pop(context);
                  },
                  imgPath: ImagesManager.articles,
                ),
                ListTileWidget(
                    title: AppStrings.liveChat,
                    onTap: () {
                      cubit.changeIndex(index: 1);
                      Navigator.pop(context);
                    },
                    imgPath: ImagesManager.liveChat),
                ListTileWidget(
                    title: AppStrings.gallery,
                    onTap: () {
                      cubit.changeIndex(index: 2);
                      Navigator.pop(context);
                    },
                    imgPath: ImagesManager.gallery),
                ListTileWidget(
                    title: AppStrings.wishList,
                    onTap: () {
                      cubit.changeIndex(index: 3);
                      Navigator.pop(context);
                    },
                    imgPath: ImagesManager.wishList),
                ListTileWidget(
                    title: AppStrings.exploreOnlineNews,
                    onTap: () {
                      cubit.changeIndex(index: 4);
                      Navigator.pop(context);
                    },
                    imgPath: ImagesManager.onlineNews),
              ],
            ));
      },
    );
  }
}
