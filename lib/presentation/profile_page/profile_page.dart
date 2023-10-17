import '../profile_page/widgets/profilelistsection_item_widget.dart';
import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';
import 'models/profilelistsection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';
import 'package:galdan_s_application2/widgets/custom_icon_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
        create: (context) =>
            ProfileBloc(ProfileState(profileModelObj: ProfileModel()))
              ..add(ProfileInitialEvent()),
        child: ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                      theme.colorScheme.secondaryContainer,
                      theme.colorScheme.onError
                    ])),
                child: Container(
                    width: double.maxFinite,
                    decoration: AppDecoration.linear,
                    child: Column(children: [
                      SizedBox(height: 44.v),
                      _buildProfileSection(context),
                      SizedBox(height: 27.v),
                      _buildProfileListSection(context),
                      SizedBox(height: 38.v),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.h, vertical: 29.v),
                          decoration: AppDecoration.white.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL30),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(height: 5.v),
                                _buildAppointment(context,
                                    menu: ImageConstant.imgLocationPrimary,
                                    appointmentLabel: "lbl_my_saved".tr),
                                SizedBox(height: 14.v),
                                Divider(),
                                SizedBox(height: 14.v),
                                _buildAppointment(context,
                                    menu: ImageConstant.imgMenuPrimary,
                                    appointmentLabel: "lbl_appointmnet".tr),
                                SizedBox(height: 14.v),
                                Divider(),
                                SizedBox(height: 14.v),
                                _buildAppointment(context,
                                    menu: ImageConstant.imgFile,
                                    appointmentLabel: "lbl_payment_method".tr),
                                SizedBox(height: 14.v),
                                Divider(),
                                SizedBox(height: 14.v),
                                _buildAppointment(context,
                                    menu: ImageConstant.imgCar,
                                    appointmentLabel: "lbl_faqs".tr),
                                SizedBox(height: 14.v),
                                Divider(),
                                SizedBox(height: 14.v),
                                _buildAppointment(context,
                                    menu: ImageConstant.imgIcRoundLogout,
                                    appointmentLabel: "lbl_logout".tr)
                              ]))
                    ])))));
  }

  /// Section Widget
  Widget _buildProfileSection(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 82.v,
          width: 81.h,
          child: Stack(alignment: Alignment.bottomRight, children: [
            CustomImageView(
                imagePath: ImageConstant.imgEllipse27,
                height: 80.adaptSize,
                width: 80.adaptSize,
                radius: BorderRadius.circular(40.h),
                alignment: Alignment.center),
            CustomIconButton(
                height: 24.adaptSize,
                width: 24.adaptSize,
                padding: EdgeInsets.all(4.h),
                decoration: IconButtonStyleHelper.fillWhiteA,
                alignment: Alignment.bottomRight,
                onTap: () {
                  onTapBtnCamera(context);
                },
                child: CustomImageView(imagePath: ImageConstant.imgCamera))
          ])),
      SizedBox(height: 19.v),
      Text("lbl_amelia_renata".tr,
          style: CustomTextStyles.titleMediumWhiteA700_1)
    ]);
  }

  /// Section Widget
  Widget _buildProfileListSection(BuildContext context) {
    return SizedBox(
        height: 75.v,
        child: BlocSelector<ProfileBloc, ProfileState, ProfileModel?>(
            selector: (state) => state.profileModelObj,
            builder: (context, profileModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 44.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 31.5.h),
                        child: SizedBox(
                            height: 44.v,
                            child: VerticalDivider(
                                width: 1.h,
                                thickness: 1.v,
                                color: appTheme.blue300)));
                  },
                  itemCount:
                      profileModelObj?.profilelistsectionItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    ProfilelistsectionItemModel model =
                        profileModelObj?.profilelistsectionItemList[index] ??
                            ProfilelistsectionItemModel();
                    return ProfilelistsectionItemWidget(model);
                  });
            }));
  }

  /// Common widget
  Widget _buildAppointment(
    BuildContext context, {
    required String menu,
    required String appointmentLabel,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    height: 48.v,
                    width: 43.h,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onErrorContainer,
                        borderRadius: BorderRadius.circular(24.h)))),
            CustomImageView(
                imagePath: menu,
                height: 26.v,
                width: 24.h,
                alignment: Alignment.center)
          ])),
      Padding(
          padding: EdgeInsets.only(left: 18.h, top: 17.v, bottom: 11.v),
          child: Text(appointmentLabel,
              style: CustomTextStyles.titleMedium16
                  .copyWith(color: theme.colorScheme.onPrimary))),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 26.v,
          width: 24.h,
          margin: EdgeInsets.only(top: 11.v, bottom: 10.v))
    ]);
  }

  /// Requests permission to access the camera and storage, and displays a model
  /// sheet for selecting images.
  ///
  /// Throws an error if permission is denied or an error occurs while selecting images.
  onTapBtnCamera(BuildContext context) async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }
}
