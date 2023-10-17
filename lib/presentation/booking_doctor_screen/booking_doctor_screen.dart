import 'bloc/booking_doctor_bloc.dart';
import 'models/booking_doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:galdan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:galdan_s_application2/widgets/custom_elevated_button.dart';
import 'package:galdan_s_application2/widgets/custom_icon_button.dart';
import 'package:galdan_s_application2/widgets/custom_text_form_field.dart';

class BookingDoctorScreen extends StatelessWidget {
  const BookingDoctorScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<BookingDoctorBloc>(
        create: (context) => BookingDoctorBloc(
            BookingDoctorState(bookingDoctorModelObj: BookingDoctorModel()))
          ..add(BookingDoctorInitialEvent()),
        child: BookingDoctorScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.h, vertical: 28.v),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4.v),
                            _buildDoctorInformation(context),
                            SizedBox(height: 38.v),
                            _buildDate(context),
                            SizedBox(height: 15.v),
                            Divider(),
                            SizedBox(height: 17.v),
                            _buildReason(context),
                            SizedBox(height: 15.v),
                            Divider(),
                            SizedBox(height: 19.v),
                            _buildPaymentDetail(context),
                            SizedBox(height: 13.v),
                            Divider(endIndent: 8.h),
                            SizedBox(height: 20.v),
                            _buildPaymentMethod(context)
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
        title: AppbarSubtitleOne(text: "lbl_appointment".tr));
  }

  /// Section Widget
  Widget _buildDoctorInformation(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 41.h),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgRectangle959,
              height: 111.adaptSize,
              width: 111.adaptSize,
              radius: BorderRadius.circular(8.h)),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 7.v, bottom: 5.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("msg_dr_marcus_horizon".tr,
                        style: theme.textTheme.titleMedium),
                    SizedBox(height: 8.v),
                    Text("lbl_chardiologist".tr,
                        style: theme.textTheme.labelLarge),
                    SizedBox(height: 8.v),
                    Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgStar,
                          height: 16.adaptSize,
                          width: 16.adaptSize),
                      Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: Text("lbl_4_7".tr,
                              style: CustomTextStyles.labelLargeAmber500))
                    ]),
                    SizedBox(height: 11.v),
                    Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLocation,
                          height: 13.adaptSize,
                          width: 13.adaptSize,
                          margin: EdgeInsets.only(bottom: 2.v)),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Text("lbl_800m_away".tr,
                              style: theme.textTheme.labelLarge))
                    ])
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 1.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("lbl_date".tr, style: CustomTextStyles.titleMedium16),
            Padding(
                padding: EdgeInsets.only(top: 2.v),
                child: Text("lbl_change".tr,
                    style: CustomTextStyles.titleSmallPrimary))
          ])),
      SizedBox(height: 7.v),
      Padding(
          padding: EdgeInsets.only(right: 42.h),
          child: Row(children: [
            CustomIconButton(
                height: 36.adaptSize,
                width: 36.adaptSize,
                padding: EdgeInsets.all(8.h),
                decoration: IconButtonStyleHelper.fillOnErrorContainerTL18,
                child: CustomImageView(imagePath: ImageConstant.imgCalendar)),
            Padding(
                padding: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 6.v),
                child: Text("msg_wednesday_jun_23".tr,
                    style: CustomTextStyles.titleSmallBluegray700))
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildReason(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("lbl_reason".tr, style: CustomTextStyles.titleMedium16),
        Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text("lbl_change".tr,
                style: CustomTextStyles.titleSmallPrimary))
      ]),
      SizedBox(height: 7.v),
      BlocSelector<BookingDoctorBloc, BookingDoctorState,
              TextEditingController?>(
          selector: (state) => state.shareController,
          builder: (context, shareController) {
            return CustomTextFormField(
                width: 122.h,
                controller: shareController,
                hintText: "lbl_chest_pain".tr,
                hintStyle: theme.textTheme.titleSmall!,
                textInputAction: TextInputAction.done,
                prefix: Container(
                    padding: EdgeInsets.all(8.h),
                    margin: EdgeInsets.only(right: 15.h),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onErrorContainer,
                        borderRadius: BorderRadius.circular(18.h)),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgShare,
                        height: 20.adaptSize,
                        width: 20.adaptSize)),
                prefixConstraints: BoxConstraints(maxHeight: 36.v),
                contentPadding: EdgeInsets.symmetric(vertical: 6.v));
          })
    ]);
  }

  /// Section Widget
  Widget _buildPaymentDetail(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_payment_detail".tr, style: CustomTextStyles.titleMedium16),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("lbl_consultation".tr,
                style: CustomTextStyles.bodyMediumGray500),
            Text("lbl_60_00".tr, style: CustomTextStyles.bodyMediumOnPrimary)
          ])),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("lbl_admin_fee".tr, style: CustomTextStyles.bodyMediumGray500),
            Text("lbl_01_00".tr, style: CustomTextStyles.bodyMediumOnPrimary)
          ])),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("msg_aditional_discount".tr,
                style: CustomTextStyles.bodyMediumGray500),
            Text("lbl".tr, style: theme.textTheme.bodyMedium)
          ])),
      SizedBox(height: 12.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("lbl_total".tr, style: theme.textTheme.titleSmall),
            Text("lbl_61_00".tr, style: CustomTextStyles.titleSmallPrimary_1)
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildPaymentMethod(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text("lbl_payment_method".tr,
              style: CustomTextStyles.titleMedium16)),
      SizedBox(height: 10.v),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 13.v),
          decoration: AppDecoration.outlineGray300
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder11),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 6.h),
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
        padding: EdgeInsets.only(left: 20.h, right: 24.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 5.v, bottom: 2.v),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_total".tr,
                        style: CustomTextStyles.titleSmallGray500),
                    SizedBox(height: 3.v),
                    Text("lbl_61_002".tr, style: theme.textTheme.titleMedium)
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

  /// Navigates to the chatWithDoctorScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the chatWithDoctorScreen.
  onTapCheckout(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.chatWithDoctorScreen,
    );
  }
}
