import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:esayshop/presentation/task_done_screen/models/task_done_model.dart';
part 'task_done_event.dart';
part 'task_done_state.dart';

/// A bloc that manages the state of a TaskDone according to the event that is dispatched to it.
class TaskDoneBloc extends Bloc<TaskDoneEvent, TaskDoneState> {
  TaskDoneBloc(TaskDoneState initialState) : super(initialState) {
    on<TaskDoneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TaskDoneInitialEvent event,
    Emitter<TaskDoneState> emit,
  ) async {
    emit(state.copyWith(
      rangeSelectionMode: RangeSelectionMode.toggledOn,
    ));
  }
}
