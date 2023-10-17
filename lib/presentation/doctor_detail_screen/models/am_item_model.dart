// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [am_item_widget] screen.
class AmItemModel extends Equatable {
  AmItemModel({
    this.am = "09:00 AM",
    this.isSelected = false,
  }) {}

  String am;

  bool isSelected;

  AmItemModel copyWith({
    String? am,
    bool? isSelected,
  }) {
    return AmItemModel(
      am: am ?? this.am,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [am, isSelected];
}
