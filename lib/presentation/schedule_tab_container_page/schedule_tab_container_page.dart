import 'bloc/schedule_tab_container_bloc.dart';
import 'models/schedule_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:galdan_s_application2/core/app_export.dart';
import 'package:galdan_s_application2/presentation/schedule_page/schedule_page.dart';
import 'package:galdan_s_application2/widgets/app_bar/appbar_title.dart';
import 'package:galdan_s_application2/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class ScheduleTabContainerPage extends StatefulWidget {
  const ScheduleTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  ScheduleTabContainerPageState createState() =>
      ScheduleTabContainerPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ScheduleTabContainerBloc>(
      create: (context) => ScheduleTabContainerBloc(ScheduleTabContainerState(
        scheduleTabContainerModelObj: ScheduleTabContainerModel(),
      ))
        ..add(ScheduleTabContainerInitialEvent()),
      child: ScheduleTabContainerPage(),
    );
  }
}

class ScheduleTabContainerPageState extends State<ScheduleTabContainerPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<ScheduleTabContainerBloc, ScheduleTabContainerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 16.v),
                  _buildTabview(context),
                  SizedBox(
                    height: 578.v,
                    child: TabBarView(
                      controller: tabviewController,
                      children: [
                        SchedulePage.builder(context),
                        SchedulePage.builder(context),
                        SchedulePage.builder(context),
                      ],
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
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 47.v,
      title: AppbarTitle(
        text: "lbl_schedule".tr,
        margin: EdgeInsets.only(left: 21.h),
      ),
      actions: [
        Container(
          height: 33.v,
          width: 24.h,
          margin: EdgeInsets.fromLTRB(20.h, 8.v, 20.h, 6.v),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgComponent1WhiteA700,
                height: 16.v,
                width: 4.h,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(
                  left: 20.h,
                  top: 17.v,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgVolume,
                height: 24.adaptSize,
                width: 24.adaptSize,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(bottom: 9.v),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 46.v,
      width: 335.h,
      decoration: BoxDecoration(
        color: appTheme.gray100,
        borderRadius: BorderRadius.circular(
          8.h,
        ),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.whiteA700,
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: theme.colorScheme.onPrimary,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w400,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            8.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl_upcoming".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_completed".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_canceled".tr,
            ),
          ),
        ],
      ),
    );
  }
}
