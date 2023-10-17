import '../../../core/app_export.dart';

/// This class is used in the [topdoctor_item_widget] screen.
class TopdoctorItemModel {
  TopdoctorItemModel({
    this.image,
    this.image1,
    this.maway,
    this.id,
  }) {
    image = image ?? ImageConstant.imgRectangle959;
    image1 = image1 ?? ImageConstant.imgStar;
    maway = maway ?? ImageConstant.imgLocation;
    id = id ?? "";
  }

  String? image;

  String? image1;

  String? maway;

  String? id;
}
