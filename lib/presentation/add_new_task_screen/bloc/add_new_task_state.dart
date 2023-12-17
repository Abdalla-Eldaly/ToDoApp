// ignore_for_file: must_be_immutable

part of 'add_new_task_bloc.dart';

/// Represents the state of AddNewTask in the application.
class AddNewTaskState extends Equatable {
  AddNewTaskState({
    this.enterTaskController,
    this.rangeStart,
    this.rangeEnd,
    this.selectedDay,
    this.focusedDay,
    this.rangeSelectionMode = RangeSelectionMode.toggledOn,
    this.addNewTaskModelObj,
  });

  TextEditingController? enterTaskController;

  AddNewTaskModel? addNewTaskModelObj;

  DateTime? rangeStart;

  DateTime? rangeEnd;

  DateTime? selectedDay;

  DateTime? focusedDay;

  RangeSelectionMode rangeSelectionMode;

  @override
  List<Object?> get props => [
        enterTaskController,
        rangeStart,
        rangeEnd,
        selectedDay,
        focusedDay,
        rangeSelectionMode,
        addNewTaskModelObj,
      ];
  AddNewTaskState copyWith({
    TextEditingController? enterTaskController,
    DateTime? rangeStart,
    DateTime? rangeEnd,
    DateTime? selectedDay,
    DateTime? focusedDay,
    RangeSelectionMode? rangeSelectionMode,
    AddNewTaskModel? addNewTaskModelObj,
  }) {
    return AddNewTaskState(
      enterTaskController: enterTaskController ?? this.enterTaskController,
      rangeStart: rangeStart ?? this.rangeStart,
      rangeEnd: rangeEnd ?? this.rangeEnd,
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
      rangeSelectionMode: rangeSelectionMode ?? this.rangeSelectionMode,
      addNewTaskModelObj: addNewTaskModelObj ?? this.addNewTaskModelObj,
    );
  }
}
