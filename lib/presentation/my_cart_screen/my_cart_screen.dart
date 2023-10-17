import '../my_cart_screen/widgets/mycart_item_widget.dart';
import 'bloc/my_cart_bloc.dart';
import 'models/my_cart_model.dart';
import 'models/mycart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:galdan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:galdan_s_application2/widgets/custom_elevated_button.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MyCartBloc>(
        create: (context) =>
            MyCartBloc(MyCartState(myCartModelObj: MyCartModel()))
              ..add(MyCartInitialEvent()),
        child: MyCartScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 24.v),
                      child: Column(children: [
                        _buildMyCart(context),
                        SizedBox(height: 34.v),
                        _buildPaymentDetail(context),
                        SizedBox(height: 19.v),
                        _buildPaymentMethod(context),
                        SizedBox(height: 5.v)
                      ])),
                  SizedBox(height: 26.v)
                ])),
            bottomNavigationBar: _buildCheckout(context)));
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
        title: AppbarSubtitleOne(text: "lbl_my_cart".tr));
  }

  /// Section Widget
  Widget _buildMyCart(BuildContext context) {
    return BlocSelector<MyCartBloc, MyCartState, MyCartModel?>(
        selector: (state) => state.myCartModelObj,
        builder: (context, myCartModelObj) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.v);
              },
              itemCount: myCartModelObj?.mycartItemList.length ?? 0,
              itemBuilder: (context, index) {
                MycartItemModel model =
                    myCartModelObj?.mycartItemList[index] ?? MycartItemModel();
                return MycartItemWidget(model);
              });
        });
  }

  /// Section Widget
  Widget _buildPaymentDetail(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_payment_detail".tr, style: CustomTextStyles.titleMedium16),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 4.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("lbl_subtotal".tr, style: theme.textTheme.bodyMedium),
            Text("lbl_25_98".tr, style: theme.textTheme.bodyMedium)
          ])),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("lbl_taxes".tr, style: theme.textTheme.bodyMedium),
            Text("lbl_1_00".tr, style: theme.textTheme.bodyMedium)
          ])),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 4.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("lbl_total".tr, style: theme.textTheme.titleSmall),
            Text("lbl_26_98".tr, style: theme.textTheme.titleSmall)
          ])),
      SizedBox(height: 13.v),
      Divider()
    ]);
  }

  /// Section Widget
  Widget _buildPaymentMethod(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 1.h),
          child: Text("lbl_payment_method".tr,
              style: CustomTextStyles.titleMedium16)),
      SizedBox(height: 10.v),
      Container(
          margin: EdgeInsets.only(left: 1.h),
          padding: EdgeInsets.all(13.h),
          decoration: AppDecoration.outlineGray300
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder11),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Text("lbl_visa".tr,
                        style:
                            CustomTextStyles.titleMediumInterPrimaryContainer)),
                Padding(
                    padding: EdgeInsets.only(top: 4.v),
                    child: Text("lbl_change".tr,
                        style: CustomTextStyles.labelLargePrimary_1))
              ]))
    ]);
  }

  /// Section Widget
  Widget _buildCheckout(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 5.v, bottom: 1.v),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_total".tr,
                        style: CustomTextStyles.titleSmallGray500),
                    SizedBox(height: 3.v),
                    Text("lbl_26_982".tr, style: theme.textTheme.titleMedium)
                  ])),
          CustomElevatedButton(
              height: 50.v,
              width: 192.h,
              text: "lbl_checkout".tr,
              buttonTextStyle: CustomTextStyles.titleSmallWhiteA700_1,
              onPressed: () {
                onTapCheckout(context);
              })
        ]));
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

  onTapCheckout(BuildContext context) {
    // TODO: implement Actions
  }
}
