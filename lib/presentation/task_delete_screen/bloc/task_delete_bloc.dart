import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:esayshop/presentation/task_delete_screen/models/task_delete_model.dart';
part 'task_delete_event.dart';
part 'task_delete_state.dart';

/// A bloc that manages the state of a TaskDelete according to the event that is dispatched to it.
class TaskDeleteBloc extends Bloc<TaskDeleteEvent, TaskDeleteState> {
  TaskDeleteBloc(TaskDeleteState initialState) : super(initialState) {
    on<TaskDeleteInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TaskDeleteInitialEvent event,
    Emitter<TaskDeleteState> emit,
  ) async {
    emit(state.copyWith(
      rangeSelectionMode: RangeSelectionMode.toggledOn,
    ));
  }
}
