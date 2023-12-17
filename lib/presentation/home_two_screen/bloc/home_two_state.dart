// ignore_for_file: must_be_immutable

part of 'home_two_bloc.dart';

/// Represents the state of HomeTwo in the application.
class HomeTwoState extends Equatable {
  HomeTwoState({
    this.thisIsTitleController,
    this.homeTwoModelObj,
  });

  TextEditingController? thisIsTitleController;

  HomeTwoModel? homeTwoModelObj;

  @override
  List<Object?> get props => [
        thisIsTitleController,
        homeTwoModelObj,
      ];
  HomeTwoState copyWith({
    TextEditingController? thisIsTitleController,
    HomeTwoModel? homeTwoModelObj,
  }) {
    return HomeTwoState(
      thisIsTitleController:
          thisIsTitleController ?? this.thisIsTitleController,
      homeTwoModelObj: homeTwoModelObj ?? this.homeTwoModelObj,
    );
  }
}
