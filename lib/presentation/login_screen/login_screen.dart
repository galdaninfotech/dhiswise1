import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';
import 'package:galdan_s_application2/core/utils/validation_functions.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:galdan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:galdan_s_application2/widgets/custom_elevated_button.dart';
import 'package:galdan_s_application2/widgets/custom_outlined_button.dart';
import 'package:galdan_s_application2/widgets/custom_text_form_field.dart';
import 'package:galdan_s_application2/domain/googleauth/google_auth_helper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:galdan_s_application2/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
          ..add(LoginInitialEvent()),
        child: LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocSelector<LoginBloc, LoginState,
                                  TextEditingController?>(
                              selector: (state) => state.emailController,
                              builder: (context, emailController) {
                                return CustomTextFormField(
                                    controller: emailController,
                                    hintText: "msg_enter_your_email".tr,
                                    textInputType: TextInputType.emailAddress,
                                    prefix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            24.h, 16.v, 16.h, 16.v),
                                        child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgCheckmark,
                                            height: 24.adaptSize,
                                            width: 24.adaptSize)),
                                    prefixConstraints:
                                        BoxConstraints(maxHeight: 56.v),
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidEmail(value,
                                              isRequired: true))) {
                                        return "Please enter valid email";
                                      }
                                      return null;
                                    },
                                    contentPadding: EdgeInsets.only(
                                        top: 18.v, right: 12.h, bottom: 18.v));
                              }),
                          SizedBox(height: 16.v),
                          BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                            return CustomTextFormField(
                                controller: state.passwordController,
                                hintText: "msg_enter_your_password".tr,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                prefix: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        24.h, 16.v, 16.h, 16.v),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgLock,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize)),
                                prefixConstraints:
                                    BoxConstraints(maxHeight: 56.v),
                                suffix: InkWell(
                                    onTap: () {
                                      context.read<LoginBloc>().add(
                                          ChangePasswordVisibilityEvent(
                                              value: !state.isShowPassword));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            12.h, 16.v, 24.h, 16.v),
                                        child: CustomImageView(
                                            imagePath: ImageConstant
                                                .imgCheckmarkGray500,
                                            height: 24.adaptSize,
                                            width: 24.adaptSize))),
                                suffixConstraints:
                                    BoxConstraints(maxHeight: 56.v),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidPassword(value,
                                          isRequired: true))) {
                                    return "Please enter valid password";
                                  }
                                  return null;
                                },
                                obscureText: state.isShowPassword);
                          }),
                          SizedBox(height: 10.v),
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtForgotPassword(context);
                                  },
                                  child: Text("msg_forgot_password".tr,
                                      style:
                                          CustomTextStyles.titleSmallPrimary))),
                          SizedBox(height: 32.v),
                          CustomElevatedButton(
                              text: "lbl_login".tr,
                              onPressed: () {
                                loginUsingFirebase(context);
                              }),
                          SizedBox(height: 25.v),
                          Padding(
                              padding: EdgeInsets.only(left: 48.h),
                              child: Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 1.v),
                                    child: Text("msg_don_t_have_an_account".tr,
                                        style: CustomTextStyles
                                            .bodyMediumGray600)),
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtSignUp(context);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 4.h),
                                        child: Text("lbl_sign_up".tr,
                                            style: CustomTextStyles
                                                .titleSmallPrimary_1)))
                              ])),
                          SizedBox(height: 34.v),
                          _buildDivider(context),
                          SizedBox(height: 29.v),
                          _buildSocial(context),
                          SizedBox(height: 5.v)
                        ])))));
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
        title: AppbarSubtitleTwo(text: "lbl_login".tr));
  }

  /// Section Widget
  Widget _buildDivider(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 9.v),
              child: SizedBox(width: 137.h, child: Divider())),
          Text("lbl_or".tr, style: theme.textTheme.bodyLarge),
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 9.v),
              child: SizedBox(width: 137.h, child: Divider()))
        ]);
  }

  /// Section Widget
  Widget _buildSocial(BuildContext context) {
    return Column(children: [
      CustomOutlinedButton(
          text: "msg_sign_in_with_google".tr,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 30.h),
              child: CustomImageView(
                  imagePath: ImageConstant.imgGoogle,
                  height: 20.v,
                  width: 19.h)),
          onPressed: () {
            onTapSignInWithGoogle(context);
          }),
      SizedBox(height: 16.v),
      CustomOutlinedButton(
          text: "msg_sign_in_with_apple".tr,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 30.h),
              child: CustomImageView(
                  imagePath: ImageConstant.imgApple,
                  height: 20.v,
                  width: 16.h))),
      SizedBox(height: 16.v),
      CustomOutlinedButton(
          text: "msg_sign_in_with_facebook".tr,
          leftIcon: Container(
              padding: EdgeInsets.fromLTRB(7.h, 4.v, 6.h, 4.v),
              margin: EdgeInsets.only(right: 30.h),
              decoration: BoxDecoration(
                  color: appTheme.blue600,
                  borderRadius: BorderRadius.circular(10.h)),
              child: CustomImageView(
                  imagePath: ImageConstant.imgFacebook,
                  height: 11.v,
                  width: 6.h)),
          onPressed: () {
            onTapSignInWithFacebook(context);
          })
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

  /// Navigates to the resetPasswordEmailTabContainerScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the resetPasswordEmailTabContainerScreen.
  onTapTxtForgotPassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.resetPasswordEmailTabContainerScreen,
    );
  }

  /// Performs a Google sign-in and returns a [GoogleUser] object.
  ///
  /// If the sign-in is successful, the [onSuccessGoogleAuthResponse] method is called
  /// with the [GoogleUser] object and [context] as a parameters.
  /// If the sign-in fails, the [onErrorGoogleAuthResponse] method is called with the [context] as a parameter.
  ///
  /// Throws an exception if the Google sign-in process fails.
  loginUsingFirebase(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        onSuccessGoogleAuthResponse(googleUser, context);
      } else {
        onErrorGoogleAuthResponse(context);
      }
    }).catchError((onError) {
      onErrorGoogleAuthResponse(context);
    });
  }

  /// Navigates to the homeContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the homeContainerScreen.
  onSuccessGoogleAuthResponse(
    GoogleSignInAccount googleUser,
    BuildContext context,
  ) {
    NavigatorService.pushNamed(
      AppRoutes.homeContainerScreen,
    );
  }

  /// Displays an alert dialog when the action is triggered.
  /// The dialog box contains a title and a message with the `There was an error login in`
  onErrorGoogleAuthResponse(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Login Error'),
              content: const Text('There was an error login in'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'))
              ],
            ));
  }

  /// Navigates to the signUpScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the signUpScreen.
  onTapTxtSignUp(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signUpScreen,
    );
  }

  /// Performs a Google sign-in and returns a [GoogleUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// a TODO comment needed to be modified by you.
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Google sign-in process fails.
  onTapSignInWithGoogle(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  /// Performs a Facebook sign-in and returns a [FacebookUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// a TODO comment needed to be modified by you.
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Facebook sign-in process fails.
  onTapSignInWithFacebook(BuildContext context) async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }
}
