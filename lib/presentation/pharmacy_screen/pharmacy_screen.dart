import '../pharmacy_screen/widgets/popularproduct_item_widget.dart';
import '../pharmacy_screen/widgets/productonsale_item_widget.dart';
import 'bloc/pharmacy_bloc.dart';
import 'dart:async';
import 'models/pharmacy_model.dart';
import 'models/popularproduct_item_model.dart';
import 'models/productonsale_item_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_trailing_image.dart';
import 'package:galdan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:galdan_s_application2/widgets/custom_search_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore_for_file: must_be_immutable
class PharmacyScreen extends StatelessWidget {
  PharmacyScreen({Key? key}) : super(key: key);

  Completer<WebViewController> webViewController =
      Completer<WebViewController>();

  static Widget builder(BuildContext context) {
    return BlocProvider<PharmacyBloc>(
        create: (context) =>
            PharmacyBloc(PharmacyState(pharmacyModelObj: PharmacyModel()))
              ..add(PharmacyInitialEvent()),
        child: PharmacyScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 24.v),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      child: BlocSelector<PharmacyBloc, PharmacyState,
                              TextEditingController?>(
                          selector: (state) => state.searchController,
                          builder: (context, searchController) {
                            return CustomSearchView(
                                controller: searchController,
                                hintText: "msg_search_drugs_category".tr);
                          })),
                  SizedBox(height: 24.v),
                  _buildCta(context),
                  SizedBox(height: 27.v),
                  _buildPopularProduct(context),
                  SizedBox(height: 26.v),
                  _buildProductOnSale(context),
                  SizedBox(height: 5.v)
                ]))));
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
        title: AppbarSubtitleOne(text: "lbl_pharmacy".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgCart,
              margin: EdgeInsets.fromLTRB(24.h, 9.v, 24.h, 7.v))
        ]);
  }

  /// Section Widget
  Widget _buildCta(BuildContext context) {
    return SizedBox(
        height: 135.v,
        width: 335.h,
        child: WebView(
            initialUrl: 'https://flutter.dev',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              webViewController.complete(controller);
            },
            onProgress: (int progress) {
              print("WebView is loading (progress : $progress%)");
            },
            onPageStarted: (String url) {
              print("Page started loading: $url");
            },
            onPageFinished: (String url) {
              print("Page finished loading: $url");
            }));
  }

  /// Section Widget
  Widget _buildPopularProduct(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 21.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(right: 24.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Text("lbl_popular_product".tr,
                                style: CustomTextStyles.titleMedium16)),
                        Padding(
                            padding: EdgeInsets.only(left: 168.h, bottom: 5.v),
                            child: Text("lbl_see_all".tr,
                                style: CustomTextStyles.labelLargePrimary_1))
                      ])),
              SizedBox(height: 10.v),
              Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                      height: 165.v,
                      child: BlocSelector<PharmacyBloc, PharmacyState,
                              PharmacyModel?>(
                          selector: (state) => state.pharmacyModelObj,
                          builder: (context, pharmacyModelObj) {
                            return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 21.h);
                                },
                                itemCount: pharmacyModelObj
                                        ?.popularproductItemList.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  PopularproductItemModel model =
                                      pharmacyModelObj
                                              ?.popularproductItemList[index] ??
                                          PopularproductItemModel();
                                  return PopularproductItemWidget(model);
                                });
                          })))
            ])));
  }

  /// Section Widget
  Widget _buildProductOnSale(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 21.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(right: 24.h),
                  child: Row(children: [
                    Text("lbl_product_on_sale".tr,
                        style: CustomTextStyles.titleMedium16),
                    Padding(
                        padding: EdgeInsets.only(left: 170.h, bottom: 3.v),
                        child: Text("lbl_see_all".tr,
                            style: CustomTextStyles.labelLargePrimary_1))
                  ])),
              SizedBox(height: 12.v),
              Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                      height: 165.v,
                      child: BlocSelector<PharmacyBloc, PharmacyState,
                              PharmacyModel?>(
                          selector: (state) => state.pharmacyModelObj,
                          builder: (context, pharmacyModelObj) {
                            return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 17.h);
                                },
                                itemCount: pharmacyModelObj
                                        ?.productonsaleItemList.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  ProductonsaleItemModel model =
                                      pharmacyModelObj
                                              ?.productonsaleItemList[index] ??
                                          ProductonsaleItemModel();
                                  return ProductonsaleItemWidget(model);
                                });
                          })))
            ])));
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
}
