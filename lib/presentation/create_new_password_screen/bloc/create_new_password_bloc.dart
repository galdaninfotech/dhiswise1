import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:galdan_s_application2/presentation/create_new_password_screen/models/create_new_password_model.dart';
part 'create_new_password_event.dart';
part 'create_new_password_state.dart';

/// A bloc that manages the state of a CreateNewPassword according to the event that is dispatched to it.
class CreateNewPasswordBloc
    extends Bloc<CreateNewPasswordEvent, CreateNewPasswordState> {
  CreateNewPasswordBloc(CreateNewPasswordState initialState)
      : super(initialState) {
    on<CreateNewPasswordInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<CreateNewPasswordState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<CreateNewPasswordState> emit,
  ) {
    emit(state.copyWith(isShowPassword1: event.value));
  }

  _onInitialize(
    CreateNewPasswordInitialEvent event,
    Emitter<CreateNewPasswordState> emit,
  ) async {
    emit(state.copyWith(
        newpasswordController: TextEditingController(),
        confirmpasswordController: TextEditingController(),
        isShowPassword: true,
        isShowPassword1: true));
  }
}
