import 'bloc/location_bloc.dart';
import 'dart:async';
import 'models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:galdan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:galdan_s_application2/widgets/custom_elevated_button.dart';
import 'package:galdan_s_application2/widgets/custom_search_view.dart';
import 'package:galdan_s_application2/widgets/custom_text_form_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore_for_file: must_be_immutable
class LocationScreen extends StatelessWidget {
  LocationScreen({Key? key}) : super(key: key);

  Completer<GoogleMapController> googleMapController = Completer();

  static Widget builder(BuildContext context) {
    return BlocProvider<LocationBloc>(
        create: (context) =>
            LocationBloc(LocationState(locationModelObj: LocationModel()))
              ..add(LocationInitialEvent()),
        child: LocationScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBarSection(context),
            body: SizedBox(
                height: 768.v,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  _buildMapSection(context),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(10.h, 83.v, 10.h, 27.v),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14.h),
                                child: BlocSelector<LocationBloc, LocationState,
                                        TextEditingController?>(
                                    selector: (state) => state.searchController,
                                    builder: (context, searchController) {
                                      return CustomSearchView(
                                          controller: searchController,
                                          hintText: "msg_search_location".tr);
                                    })),
                            SizedBox(height: 69.v),
                            CustomImageView(
                                imagePath: ImageConstant.imgGroup183,
                                height: 268.v,
                                width: 285.h,
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: 12.h)),
                            Spacer(),
                            _buildConfirmYourAddressSection(context)
                          ])))
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBarSection(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 64.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "lbl_ambulance".tr));
  }

  /// Section Widget
  Widget _buildMapSection(BuildContext context) {
    return SizedBox(
        height: 768.v,
        width: double.maxFinite,
        child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(37.43296265331129, -122.08832357078792),
                zoom: 14.4746),
            onMapCreated: (GoogleMapController controller) {
              googleMapController.complete(controller);
            },
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: false));
  }

  /// Section Widget
  Widget _buildConfirmYourAddressSection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 14.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2.v),
              BlocSelector<LocationBloc, LocationState, TextEditingController?>(
                  selector: (state) => state.addressController,
                  builder: (context, addressController) {
                    return CustomTextFormField(
                        controller: addressController,
                        hintText: "msg_confirm_your_address".tr,
                        hintStyle: theme.textTheme.titleSmall!,
                        textInputAction: TextInputAction.done,
                        contentPadding: EdgeInsets.symmetric(horizontal: 4.h),
                        borderDecoration:
                            TextFormFieldStyleHelper.underLineGray);
                  }),
              SizedBox(height: 16.v),
              Padding(
                  padding: EdgeInsets.only(left: 17.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgLocationRed700,
                            height: 26.adaptSize,
                            width: 26.adaptSize,
                            margin: EdgeInsets.only(top: 4.v, bottom: 10.v)),
                        Container(
                            width: 190.h,
                            margin: EdgeInsets.only(left: 17.h),
                            child: Text("msg_1111_abcd_rd_102".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(height: 1.50)))
                      ])),
              SizedBox(height: 10.v),
              CustomElevatedButton(
                  height: 50.v,
                  text: "msg_confirm_location".tr,
                  margin: EdgeInsets.symmetric(horizontal: 4.h))
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
}
