import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:esayshop/presentation/home_two_screen/models/home_two_model.dart';
part 'home_two_event.dart';
part 'home_two_state.dart';

/// A bloc that manages the state of a HomeTwo according to the event that is dispatched to it.
class HomeTwoBloc extends Bloc<HomeTwoEvent, HomeTwoState> {
  HomeTwoBloc(HomeTwoState initialState) : super(initialState) {
    on<HomeTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomeTwoInitialEvent event,
    Emitter<HomeTwoState> emit,
  ) async {
    emit(state.copyWith(
      thisIsTitleController: TextEditingController(),
    ));
  }
}
