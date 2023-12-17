// ignore_for_file: must_be_immutable

part of 'task_delete_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///TaskDelete widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class TaskDeleteEvent extends Equatable {}

/// Event that is dispatched when the TaskDelete widget is first created.
class TaskDeleteInitialEvent extends TaskDeleteEvent {
  @override
  List<Object?> get props => [];
}
