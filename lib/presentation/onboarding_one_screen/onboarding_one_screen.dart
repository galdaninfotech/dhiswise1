import 'bloc/onboarding_one_bloc.dart';
import 'models/onboarding_one_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';
import 'package:galdan_s_application2/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingOneScreen extends StatelessWidget {
  const OnboardingOneScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingOneBloc>(
        create: (context) => OnboardingOneBloc(
            OnboardingOneState(onboardingOneModelObj: OnboardingOneModel()))
          ..add(OnboardingOneInitialEvent()),
        child: OnboardingOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<OnboardingOneBloc, OnboardingOneState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
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
                  child: SizedBox(
                      height: 768.v,
                      width: double.maxFinite,
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        CustomImageView(
                            imagePath: ImageConstant.img7xm1,
                            height: 468.v,
                            width: 311.h,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 51.v)),
                        _buildOnboardingOneNext(context)
                      ])))));
    });
  }

  /// Section Widget
  Widget _buildOnboardingOneNext(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 42.h, vertical: 31.v),
            decoration: AppDecoration.white
                .copyWith(borderRadius: BorderRadiusStyle.customBorderTL64),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 276.h,
                      margin: EdgeInsets.only(left: 2.h, right: 12.h),
                      child: Text("msg_consult_only_with".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleLarge!
                              .copyWith(height: 1.50))),
                  SizedBox(height: 11.v),
                  Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          height: 8.v,
                          child: AnimatedSmoothIndicator(
                              activeIndex: 0,
                              count: 3,
                              effect: ScrollingDotsEffect(
                                  spacing: 4,
                                  activeDotColor: theme.colorScheme.primary,
                                  dotColor: appTheme.blue50,
                                  dotHeight: 8.v,
                                  dotWidth: 8.h)))),
                  SizedBox(height: 54.v),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              onTapTxtSkip(context);
                            },
                            child: Padding(
                                padding:
                                    EdgeInsets.only(top: 20.v, bottom: 18.v),
                                child: Text("lbl_skip".tr,
                                    style:
                                        CustomTextStyles.titleSmallPrimary))),
                        CustomElevatedButton(
                            width: 145.h,
                            text: "lbl_next".tr,
                            onPressed: () {
                              onTapNext(context);
                            })
                      ]),
                  SizedBox(height: 4.v)
                ])));
  }

  /// Navigates to the onboardingFourScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the onboardingFourScreen.
  onTapTxtSkip(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.onboardingFourScreen,
    );
  }

  /// Navigates to the onboardingTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the onboardingTwoScreen.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.onboardingTwoScreen,
    );
  }
}
