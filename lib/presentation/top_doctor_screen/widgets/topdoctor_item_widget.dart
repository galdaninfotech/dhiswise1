import '../models/topdoctor_item_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';

// ignore: must_be_immutable
class TopdoctorItemWidget extends StatelessWidget {
  TopdoctorItemWidget(
    this.topdoctorItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TopdoctorItemModel topdoctorItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.v),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder11,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomImageView(
            imagePath: topdoctorItemModelObj?.image,
            height: 111.adaptSize,
            width: 111.adaptSize,
            radius: BorderRadius.circular(
              8.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 5.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "msg_dr_marcus_horizon2".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 8.v),
                Text(
                  "lbl_chardiologist".tr,
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 8.v),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: topdoctorItemModelObj?.image1,
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "lbl_4_7".tr,
                        style: CustomTextStyles.labelLargeAmber500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 11.v),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: topdoctorItemModelObj?.maway,
                      height: 13.adaptSize,
                      width: 13.adaptSize,
                      margin: EdgeInsets.only(bottom: 2.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.h),
                      child: Text(
                        "lbl_800m_away".tr,
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
