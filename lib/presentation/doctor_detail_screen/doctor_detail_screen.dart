import '../doctor_detail_screen/widgets/am_item_widget.dart';
import 'bloc/doctor_detail_bloc.dart';
import 'models/am_item_model.dart';
import 'models/doctor_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_trailing_image.dart';
import 'package:galdan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:galdan_s_application2/widgets/custom_elevated_button.dart';
import 'package:galdan_s_application2/widgets/custom_icon_button.dart';
import 'package:readmore/readmore.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<DoctorDetailBloc>(
        create: (context) => DoctorDetailBloc(
            DoctorDetailState(doctorDetailModelObj: DoctorDetailModel()))
          ..add(DoctorDetailInitialEvent()),
        child: DoctorDetailScreen());
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
                          horizontal: 24.h, vertical: 32.v),
                      child: Column(children: [
                        _buildDoctorInformation(context),
                        SizedBox(height: 31.v),
                        _buildDateTime(context),
                        SizedBox(height: 5.v)
                      ])),
                  SizedBox(height: 28.v)
                ])),
            bottomNavigationBar: _buildNinetyFour(context)));
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
        title: AppbarSubtitleOne(text: "lbl_details".tr),
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
  Widget _buildDoctorInformation(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
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
          ])),
      SizedBox(height: 17.v),
      Text("lbl_about".tr, style: CustomTextStyles.titleMedium16),
      SizedBox(height: 8.v),
      SizedBox(
          width: 305.h,
          child: ReadMoreText("msg_lorem_ipsum_dolor".tr,
              trimLines: 3,
              colorClickableText: theme.colorScheme.primary,
              trimMode: TrimMode.Line,
              trimCollapsedText: "lbl_read_more".tr,
              moreStyle:
                  CustomTextStyles.bodySmallGray600.copyWith(height: 1.50),
              lessStyle:
                  CustomTextStyles.bodySmallGray600.copyWith(height: 1.50)))
    ]);
  }

  /// Section Widget
  Widget _buildDateTime(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 9.v),
            decoration: AppDecoration.outlineGray300
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 5.v),
                  Text("lbl_mon".tr, style: theme.textTheme.labelMedium),
                  SizedBox(height: 4.v),
                  Text("lbl_21".tr, style: theme.textTheme.titleMedium)
                ])),
        Container(
            margin: EdgeInsets.only(left: 12.h),
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 9.v),
            decoration: AppDecoration.outlineGray300
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 5.v),
                  Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text("lbl_tue".tr,
                          style: theme.textTheme.labelMedium)),
                  SizedBox(height: 4.v),
                  Text("lbl_22".tr, style: theme.textTheme.titleMedium)
                ])),
        Container(
            margin: EdgeInsets.only(left: 11.h),
            padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 8.v),
            decoration: AppDecoration.fillPrimary
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 6.v),
                  Text("lbl_wed".tr,
                      style: CustomTextStyles.labelMediumWhiteA700),
                  SizedBox(height: 5.v),
                  Text("lbl_23".tr,
                      style: CustomTextStyles.titleMediumWhiteA700_1)
                ])),
        Container(
            margin: EdgeInsets.only(left: 11.h),
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.v),
            decoration: AppDecoration.outlineGray300
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 6.v),
                  Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text("lbl_thu".tr,
                          style: theme.textTheme.labelMedium)),
                  SizedBox(height: 5.v),
                  Text("lbl_24".tr, style: theme.textTheme.titleMedium)
                ])),
        Container(
            margin: EdgeInsets.only(left: 11.h),
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 7.v),
            decoration: AppDecoration.outlineGray300
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 6.v),
                  Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Text("lbl_fri".tr,
                          style: theme.textTheme.labelMedium)),
                  SizedBox(height: 5.v),
                  Text("lbl_25".tr, style: theme.textTheme.titleMedium)
                ])),
        Container(
            margin: EdgeInsets.only(left: 6.h),
            padding: EdgeInsets.all(10.h),
            decoration: AppDecoration.outlineGray300
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 4.v),
                  Padding(
                      padding: EdgeInsets.only(left: 3.h),
                      child: Text("lbl_sat".tr,
                          style: theme.textTheme.labelMedium)),
                  SizedBox(height: 3.v),
                  Text("lbl_26".tr, style: theme.textTheme.titleMedium)
                ]))
      ]),
      SizedBox(height: 32.v),
      Divider(),
      SizedBox(height: 32.v),
      BlocSelector<DoctorDetailBloc, DoctorDetailState, DoctorDetailModel?>(
          selector: (state) => state.doctorDetailModelObj,
          builder: (context, doctorDetailModelObj) {
            return Wrap(
                runSpacing: 9.v,
                spacing: 9.h,
                children: List<Widget>.generate(
                    doctorDetailModelObj?.amItemList.length ?? 0, (index) {
                  AmItemModel model =
                      doctorDetailModelObj?.amItemList[index] ?? AmItemModel();
                  return AmItemWidget(model, onSelectedChipView: (value) {
                    context.read<DoctorDetailBloc>().add(
                        UpdateChipViewEvent(index: index, isSelected: value));
                  });
                }));
          })
    ]);
  }

  /// Section Widget
  Widget _buildNinetyFour(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 50.adaptSize,
              width: 50.adaptSize,
              padding: EdgeInsets.all(13.h),
              decoration: IconButtonStyleHelper.fillOnErrorContainer,
              child: CustomImageView(imagePath: ImageConstant.imgMusicPrimary)),
          Expanded(
              child: CustomElevatedButton(
                  height: 50.v,
                  text: "lbl_book_apointment".tr,
                  margin: EdgeInsets.only(left: 16.h),
                  buttonTextStyle: CustomTextStyles.titleSmallWhiteA700_1,
                  onPressed: () {
                    onTapBookApointment(context);
                  }))
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

  /// Navigates to the bookingDoctorScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the bookingDoctorScreen.
  onTapBookApointment(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.bookingDoctorScreen,
    );
  }
}
