import 'bloc/reset_password_phone_bloc.dart';
import 'models/reset_password_phone_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';
import 'package:galdan_s_application2/core/utils/validation_functions.dart';
import 'package:galdan_s_application2/widgets/custom_elevated_button.dart';
import 'package:galdan_s_application2/widgets/custom_text_form_field.dart';

class ResetPasswordPhonePage extends StatefulWidget {
  const ResetPasswordPhonePage({Key? key}) : super(key: key);

  @override
  ResetPasswordPhonePageState createState() => ResetPasswordPhonePageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ResetPasswordPhoneBloc>(
        create: (context) => ResetPasswordPhoneBloc(ResetPasswordPhoneState(
            resetPasswordPhoneModelObj: ResetPasswordPhoneModel()))
          ..add(ResetPasswordPhoneInitialEvent()),
        child: ResetPasswordPhonePage());
  }
}

// ignore_for_file: must_be_immutable
class ResetPasswordPhonePageState extends State<ResetPasswordPhonePage>
    with AutomaticKeepAliveClientMixin<ResetPasswordPhonePage> {
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
                  _buildMobileNoSection(context)
                ])))));
  }

  /// Section Widget
  Widget _buildMobileNoSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(children: [
          BlocSelector<ResetPasswordPhoneBloc, ResetPasswordPhoneState,
                  TextEditingController?>(
              selector: (state) => state.mobileNoController,
              builder: (context, mobileNoController) {
                return CustomTextFormField(
                    controller: mobileNoController,
                    hintText: "lbl_1234567890".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.phone,
                    prefix: Container(
                        margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgCall,
                            height: 24.adaptSize,
                            width: 24.adaptSize)),
                    prefixConstraints: BoxConstraints(maxHeight: 56.v),
                    validator: (value) {
                      if (!isValidPhone(value)) {
                        return "Please enter valid phone number";
                      }
                      return null;
                    },
                    contentPadding:
                        EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v));
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
