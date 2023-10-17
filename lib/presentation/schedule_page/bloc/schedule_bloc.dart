import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/schedulelist_item_model.dart';
import 'package:galdan_s_application2/presentation/schedule_page/models/schedule_model.dart';
part 'schedule_event.dart';
part 'schedule_state.dart';

/// A bloc that manages the state of a Schedule according to the event that is dispatched to it.
class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc(ScheduleState initialState) : super(initialState) {
    on<ScheduleInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ScheduleInitialEvent event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(state.copyWith(
        scheduleModelObj: state.scheduleModelObj?.copyWith(
      schedulelistItemList: fillSchedulelistItemList(),
    )));
  }

  List<SchedulelistItemModel> fillSchedulelistItemList() {
    return [
      SchedulelistItemModel(
          drMarcusHorizon: "Dr. Marcus Horizon",
          chardiologist: "Chardiologist",
          drMarcusHorizon1: ImageConstant.imgClose,
          image: ImageConstant.imgCalendarBlueGray700,
          date: "26/06/2022",
          image1: ImageConstant.imgSearchBlueGray700,
          time: "10:30 AM"),
      SchedulelistItemModel(
          drMarcusHorizon: "Dr. Alysa Hana",
          chardiologist: "Psikeater",
          drMarcusHorizon1: ImageConstant.imgProfile,
          image: ImageConstant.imgCalendarBlueGray700,
          date: "28/06/2022",
          image1: ImageConstant.imgSearchBlueGray700,
          time: "2:00 PM")
    ];
  }
}
