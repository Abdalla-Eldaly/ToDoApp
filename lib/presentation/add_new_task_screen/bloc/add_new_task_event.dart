// ignore_for_file: must_be_immutable

part of 'add_new_task_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddNewTask widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddNewTaskEvent extends Equatable {}

/// Event that is dispatched when the AddNewTask widget is first created.
class AddNewTaskInitialEvent extends AddNewTaskEvent {
  @override
  List<Object?> get props => [];
}
