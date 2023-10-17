import '../../../core/app_export.dart';

/// This class is used in the [schedulelist_item_widget] screen.
class SchedulelistItemModel {
  SchedulelistItemModel({
    this.drMarcusHorizon,
    this.chardiologist,
    this.drMarcusHorizon1,
    this.image,
    this.date,
    this.image1,
    this.time,
    this.id,
  }) {
    drMarcusHorizon = drMarcusHorizon ?? "Dr. Marcus Horizon";
    chardiologist = chardiologist ?? "Chardiologist";
    drMarcusHorizon1 = drMarcusHorizon1 ?? ImageConstant.imgClose;
    image = image ?? ImageConstant.imgCalendarBlueGray700;
    date = date ?? "26/06/2022";
    image1 = image1 ?? ImageConstant.imgSearchBlueGray700;
    time = time ?? "10:30 AM";
    id = id ?? "";
  }

  String? drMarcusHorizon;

  String? chardiologist;

  String? drMarcusHorizon1;

  String? image;

  String? date;

  String? image1;

  String? time;

  String? id;
}
