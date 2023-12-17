// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [task_done_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TaskDoneModel extends Equatable {
  TaskDoneModel() {}

  TaskDoneModel copyWith() {
    return TaskDoneModel();
  }

  @override
  List<Object?> get props => [];
}
