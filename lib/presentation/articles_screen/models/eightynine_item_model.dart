import '../../../core/app_export.dart';

/// This class is used in the [eightynine_item_widget] screen.
class EightynineItemModel {
  EightynineItemModel({
    this.covidNineteen,
    this.bookmark,
    this.comparingtheAstraZen,
    this.jun,
    this.time,
    this.id,
  }) {
    covidNineteen = covidNineteen ?? ImageConstant.imgRectangle460;
    bookmark = bookmark ?? ImageConstant.imgBookmarkWhiteA700;
    comparingtheAstraZen = comparingtheAstraZen ??
        "Comparing the AstraZeneca and Sinovac COVID-19 Vaccines";
    jun = jun ?? "Jun 12, 2021";
    time = time ?? "6 min read";
    id = id ?? "";
  }

  String? covidNineteen;

  String? bookmark;

  String? comparingtheAstraZen;

  String? jun;

  String? time;

  String? id;
}
