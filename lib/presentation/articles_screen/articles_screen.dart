import '../articles_screen/widgets/eightynine_item_widget.dart';
import '../articles_screen/widgets/frametwentyfour_item_widget.dart';
import '../articles_screen/widgets/sixtyfour_item_widget.dart';
import 'bloc/articles_bloc.dart';
import 'models/articles_model.dart';
import 'models/eightynine_item_model.dart';
import 'models/frametwentyfour_item_model.dart';
import 'models/sixtyfour_item_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_trailing_image.dart';
import 'package:galdan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:galdan_s_application2/widgets/custom_search_view.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ArticlesBloc>(
        create: (context) =>
            ArticlesBloc(ArticlesState(articlesModelObj: ArticlesModel()))
              ..add(ArticlesInitialEvent()),
        child: ArticlesScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 24.v),
                    child: Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 4.h, right: 24.h),
                                  child: BlocSelector<
                                          ArticlesBloc,
                                          ArticlesState,
                                          TextEditingController?>(
                                      selector: (state) =>
                                          state.searchController,
                                      builder: (context, searchController) {
                                        return CustomSearchView(
                                            controller: searchController,
                                            hintText: "msg_search_articles".tr);
                                      })),
                              SizedBox(height: 28.v),
                              _buildPopularArticles(context),
                              SizedBox(height: 27.v),
                              _buildTrendingArticles(context),
                              SizedBox(height: 26.v),
                              _buildRelatedArticles(context)
                            ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 64.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "lbl_articles".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.symmetric(horizontal: 16.h),
              onTap: () {
                onTapOverflowMenu(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildPopularArticles(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_popular_articles".tr,
              style: CustomTextStyles.titleMedium16),
          SizedBox(height: 10.v),
          BlocSelector<ArticlesBloc, ArticlesState, ArticlesModel?>(
              selector: (state) => state.articlesModelObj,
              builder: (context, articlesModelObj) {
                return Wrap(
                    runSpacing: 5.v,
                    spacing: 5.h,
                    children: List<Widget>.generate(
                        articlesModelObj?.frametwentyfourItemList.length ?? 0,
                        (index) {
                      FrametwentyfourItemModel model =
                          articlesModelObj?.frametwentyfourItemList[index] ??
                              FrametwentyfourItemModel();
                      return FrametwentyfourItemWidget(model,
                          onSelectedChipView: (value) {
                        context.read<ArticlesBloc>().add(UpdateChipViewEvent(
                            index: index, isSelected: value));
                      });
                    }));
              })
        ]));
  }

  /// Section Widget
  Widget _buildTrendingArticles(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 4.h, right: 24.h),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 1.v),
                    child: Text("msg_trending_articles".tr,
                        style: CustomTextStyles.titleMedium16)),
                Padding(
                    padding: EdgeInsets.only(bottom: 5.v),
                    child: Text("lbl_see_all".tr,
                        style: CustomTextStyles.labelLargePrimary_1))
              ])),
      SizedBox(height: 10.v),
      Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
              height: 219.v,
              child: BlocSelector<ArticlesBloc, ArticlesState, ArticlesModel?>(
                  selector: (state) => state.articlesModelObj,
                  builder: (context, articlesModelObj) {
                    return ListView.separated(
                        padding: EdgeInsets.only(left: 4.h),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 15.h);
                        },
                        itemCount:
                            articlesModelObj?.eightynineItemList.length ?? 0,
                        itemBuilder: (context, index) {
                          EightynineItemModel model =
                              articlesModelObj?.eightynineItemList[index] ??
                                  EightynineItemModel();
                          return EightynineItemWidget(model);
                        });
                  })))
    ]);
  }

  /// Section Widget
  Widget _buildRelatedArticles(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 4.h, right: 24.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("msg_related_articles".tr,
                style: CustomTextStyles.titleMediumBlack900),
            Padding(
                padding: EdgeInsets.only(bottom: 3.v),
                child: Text("lbl_see_all".tr,
                    style: CustomTextStyles.labelLargePrimary_1))
          ])),
      SizedBox(height: 12.v),
      Padding(
          padding: EdgeInsets.only(right: 20.h),
          child: BlocSelector<ArticlesBloc, ArticlesState, ArticlesModel?>(
              selector: (state) => state.articlesModelObj,
              builder: (context, articlesModelObj) {
                return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10.v);
                    },
                    itemCount: articlesModelObj?.sixtyfourItemList.length ?? 0,
                    itemBuilder: (context, index) {
                      SixtyfourItemModel model =
                          articlesModelObj?.sixtyfourItemList[index] ??
                              SixtyfourItemModel();
                      return SixtyfourItemWidget(model);
                    });
              }))
    ]);
  }

  /// Navigates to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is
  /// used to build the navigation stack. When the action is triggered, this
  /// function uses the [NavigatorService] to navigate to the previous screen
  /// in the navigation stack.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the homeContainerScreen.
  onTapOverflowMenu(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
