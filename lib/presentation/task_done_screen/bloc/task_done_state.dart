// ignore_for_file: must_be_immutable

part of 'task_done_bloc.dart';

/// Represents the state of TaskDone in the application.
class TaskDoneState extends Equatable {
  TaskDoneState({
    this.rangeStart,
    this.rangeEnd,
    this.selectedDay,
    this.focusedDay,
    this.rangeSelectionMode = RangeSelectionMode.toggledOn,
    this.taskDoneModelObj,
  });

  TaskDoneModel? taskDoneModelObj;

  DateTime? rangeStart;

  DateTime? rangeEnd;

  DateTime? selectedDay;

  DateTime? focusedDay;

  RangeSelectionMode rangeSelectionMode;

  @override
  List<Object?> get props => [
        rangeStart,
        rangeEnd,
        selectedDay,
        focusedDay,
        rangeSelectionMode,
        taskDoneModelObj,
      ];
  TaskDoneState copyWith({
    DateTime? rangeStart,
    DateTime? rangeEnd,
    DateTime? selectedDay,
    DateTime? focusedDay,
    RangeSelectionMode? rangeSelectionMode,
    TaskDoneModel? taskDoneModelObj,
  }) {
    return TaskDoneState(
      rangeStart: rangeStart ?? this.rangeStart,
      rangeEnd: rangeEnd ?? this.rangeEnd,
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
      rangeSelectionMode: rangeSelectionMode ?? this.rangeSelectionMode,
      taskDoneModelObj: taskDoneModelObj ?? this.taskDoneModelObj,
    );
  }
}
