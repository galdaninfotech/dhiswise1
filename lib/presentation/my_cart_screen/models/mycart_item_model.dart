import '../../../core/app_export.dart';

/// This class is used in the [mycart_item_widget] screen.
class MycartItemModel {
  MycartItemModel({
    this.oBHCombi,
    this.oBHCombi1,
    this.measurement,
    this.image,
    this.one,
    this.image1,
    this.image2,
    this.price,
    this.id,
  }) {
    oBHCombi = oBHCombi ?? ImageConstant.imgHealthvitLLys50x50;
    oBHCombi1 = oBHCombi1 ?? "OBH Combi";
    measurement = measurement ?? "75ml";
    image = image ?? ImageConstant.imgMenuGray500;
    one = one ?? "1";
    image1 = image1 ?? ImageConstant.imgPlus;
    image2 = image2 ?? ImageConstant.imgTrashGray500;
    price = price ?? "9.99";
    id = id ?? "";
  }

  String? oBHCombi;

  String? oBHCombi1;

  String? measurement;

  String? image;

  String? one;

  String? image1;

  String? image2;

  String? price;

  String? id;
}
