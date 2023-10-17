import '../../../core/app_export.dart';

/// This class is used in the [doctor_item_widget] screen.
class DoctorItemModel {
  DoctorItemModel({
    this.circleImage,
    this.image,
    this.drMarcusHorizon,
    this.maway,
    this.id,
  }) {
    circleImage = circleImage ?? ImageConstant.imgEllipse88;
    image = image ?? ImageConstant.imgStar;
    drMarcusHorizon = drMarcusHorizon ?? "Dr. Marcus Horizon";
    maway = maway ?? ImageConstant.imgLocation;
    id = id ?? "";
  }

  String? circleImage;

  String? image;

  String? drMarcusHorizon;

  String? maway;

  String? id;
}
