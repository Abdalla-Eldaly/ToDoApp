import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:esayshop/presentation/add_new_task_screen/models/add_new_task_model.dart';
part 'add_new_task_event.dart';
part 'add_new_task_state.dart';

/// A bloc that manages the state of a AddNewTask according to the event that is dispatched to it.
class AddNewTaskBloc extends Bloc<AddNewTaskEvent, AddNewTaskState> {
  AddNewTaskBloc(AddNewTaskState initialState) : super(initialState) {
    on<AddNewTaskInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AddNewTaskInitialEvent event,
    Emitter<AddNewTaskState> emit,
  ) async {
    emit(state.copyWith(
      enterTaskController: TextEditingController(),
      rangeSelectionMode: RangeSelectionMode.toggledOn,
    ));
  }
}
