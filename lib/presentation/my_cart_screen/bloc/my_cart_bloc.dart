import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/mycart_item_model.dart';
import 'package:galdan_s_application2/presentation/my_cart_screen/models/my_cart_model.dart';
part 'my_cart_event.dart';
part 'my_cart_state.dart';

/// A bloc that manages the state of a MyCart according to the event that is dispatched to it.
class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  MyCartBloc(MyCartState initialState) : super(initialState) {
    on<MyCartInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MyCartInitialEvent event,
    Emitter<MyCartState> emit,
  ) async {
    emit(state.copyWith(
        myCartModelObj: state.myCartModelObj
            ?.copyWith(mycartItemList: fillMycartItemList())));
  }

  List<MycartItemModel> fillMycartItemList() {
    return [
      MycartItemModel(
          oBHCombi: ImageConstant.imgHealthvitLLys50x50,
          oBHCombi1: "OBH Combi",
          measurement: "75ml",
          image: ImageConstant.imgMenuGray500,
          one: "1",
          image1: ImageConstant.imgPlus,
          image2: ImageConstant.imgTrashGray500,
          price: "9.99")
    ];
  }
}
