// ignore_for_file: must_be_immutable

part of 'task_done_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///TaskDone widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class TaskDoneEvent extends Equatable {}

/// Event that is dispatched when the TaskDone widget is first created.
class TaskDoneInitialEvent extends TaskDoneEvent {
  @override
  List<Object?> get props => [];
}
