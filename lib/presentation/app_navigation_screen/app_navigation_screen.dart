import 'bloc/app_navigation_bloc.dart';
import 'models/app_navigation_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(AppNavigationState(
        appNavigationModelObj: AppNavigationModel(),
      ))
        ..add(AppNavigationInitialEvent()),
      child: AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0XFFFFFFFF),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildAppNavigation(context),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                        ),
                        child: Column(
                          children: [
                            _buildScreenTitle(
                              context,
                              userName: "Splash Screen".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.splashScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Onboarding One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.onboardingOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Onboarding Two".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.onboardingTwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Onboarding Three".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.onboardingThreeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Onboarding Four".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.onboardingFourScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Login".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.loginScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Sign Up".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.signUpScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName:
                                  "Reset Password - Email - Tab Container".tr,
                              onTapScreenTitle: () => onTapScreenTitle(AppRoutes
                                  .resetPasswordEmailTabContainerScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Reset Password - Verify Code".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.resetPasswordVerifyCodeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Create New Password".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.createNewPasswordScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Home - Container".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.homeContainerScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Top Doctor".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.topDoctorScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Find Doctors".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.findDoctorsScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Doctor Detail".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.doctorDetailScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Booking Doctor".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.bookingDoctorScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Chat with Doctor".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.chatWithDoctorScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Audio Call".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.audioCallScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Video Call".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.videoCallScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Articles".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.articlesScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Pharmacy".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.pharmacyScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Drugs Detail".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.drugsDetailScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "My Cart".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.myCartScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              userName: "Location".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.locationScreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String userName,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  userName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
