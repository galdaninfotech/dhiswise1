// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [frametwentyfour_item_widget] screen.
class FrametwentyfourItemModel extends Equatable {
  FrametwentyfourItemModel({
    this.covidNineteen = "Covid-19",
    this.isSelected = false,
  }) {}

  String covidNineteen;

  bool isSelected;

  FrametwentyfourItemModel copyWith({
    String? covidNineteen,
    bool? isSelected,
  }) {
    return FrametwentyfourItemModel(
      covidNineteen: covidNineteen ?? this.covidNineteen,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [covidNineteen, isSelected];
}
