import 'bloc/reset_password_email_bloc.dart';
import 'models/reset_password_email_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';
import 'package:galdan_s_application2/core/utils/validation_functions.dart';
import 'package:galdan_s_application2/widgets/custom_elevated_button.dart';
import 'package:galdan_s_application2/widgets/custom_text_form_field.dart';

class ResetPasswordEmailPage extends StatefulWidget {
  const ResetPasswordEmailPage({Key? key}) : super(key: key);

  @override
  ResetPasswordEmailPageState createState() => ResetPasswordEmailPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ResetPasswordEmailBloc>(
        create: (context) => ResetPasswordEmailBloc(ResetPasswordEmailState(
            resetPasswordEmailModelObj: ResetPasswordEmailModel()))
          ..add(ResetPasswordEmailInitialEvent()),
        child: ResetPasswordEmailPage());
  }
}

// ignore_for_file: must_be_immutable
class ResetPasswordEmailPageState extends State<ResetPasswordEmailPage>
    with AutomaticKeepAliveClientMixin<ResetPasswordEmailPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 24.v),
                  _buildEmailAndSendOTP(context)
                ])))));
  }

  /// Section Widget
  Widget _buildEmailAndSendOTP(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(children: [
          BlocSelector<ResetPasswordEmailBloc, ResetPasswordEmailState,
                  TextEditingController?>(
              selector: (state) => state.emailController,
              builder: (context, emailController) {
                return CustomTextFormField(
                    controller: emailController,
                    hintText: "lbl_xyz_gmail_com".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                    prefix: Container(
                        margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgClock,
                            height: 24.adaptSize,
                            width: 24.adaptSize)),
                    prefixConstraints: BoxConstraints(maxHeight: 56.v),
                    suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 20.v, 24.h, 20.v),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgCheckmarkGreen600,
                            height: 16.adaptSize,
                            width: 16.adaptSize)),
                    suffixConstraints: BoxConstraints(maxHeight: 56.v),
                    validator: (value) {
                      if (value == null ||
                          (!isValidEmail(value, isRequired: true))) {
                        return "Please enter valid email";
                      }
                      return null;
                    });
              }),
          SizedBox(height: 32.v),
          CustomElevatedButton(
              text: "lbl_send_otp".tr,
              onPressed: () {
                onTapSendOTP(context);
              })
        ]));
  }

  /// Navigates to the resetPasswordVerifyCodeScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the resetPasswordVerifyCodeScreen.
  onTapSendOTP(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.resetPasswordVerifyCodeScreen,
    );
  }
}
