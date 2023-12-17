import 'bloc/home_bloc.dart';
import 'models/home_model.dart';
import 'package:esayshop/core/app_export.dart';
import 'package:esayshop/widgets/app_bar/appbar_title.dart';
import 'package:esayshop/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(
        homeModelObj: HomeModel(),
      ))
        ..add(HomeInitialEvent()),
      child: HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 412.h,
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              _buildFortyTwo(context),
              SizedBox(height: 45.v),
              _buildNine(context),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFortyTwo(BuildContext context) {
    return SizedBox(
      height: 189.v,
      width: 412.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomAppBar(
            title: AppbarTitle(
              text: "lbl_to_do_list".tr,
              margin: EdgeInsets.only(
                left: 51.h,
                top: 28.v,
                bottom: 94.v,
              ),
            ),
            styleType: Style.bgFill,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return SizedBox(
                  height: 79.v,
                  width: 370.h,
                  child: TableCalendar(
                    locale: 'en_US',
                    firstDay: DateTime(DateTime.now().year - 5),
                    lastDay: DateTime(DateTime.now().year + 5),
                    calendarFormat: CalendarFormat.month,
                    rangeSelectionMode: state.rangeSelectionMode,
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    calendarStyle: CalendarStyle(
                      outsideDaysVisible: false,
                      isTodayHighlighted: true,
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(),
                    headerVisible: false,
                    focusedDay: state.focusedDay ?? DateTime.now(),
                    rangeStartDay: state.rangeStart,
                    rangeEndDay: state.rangeEnd,
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(state.selectedDay, selectedDay)) {
                        state.focusedDay = focusedDay;
                        state.selectedDay = selectedDay;
                        state.rangeSelectionMode = RangeSelectionMode.toggledOn;
                      }
                    },
                    onRangeSelected: (start, end, focusedDay) {
                      state.focusedDay = focusedDay;
                      state.rangeEnd = end;
                      state.rangeStart = start;
                      state.rangeSelectionMode = RangeSelectionMode.toggledOn;
                    },
                    onPageChanged: (focusedDay) {
                      state.focusedDay = focusedDay;
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNine(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 33.h,
        right: 27.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 17.h,
        vertical: 23.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 69.v,
            child: VerticalDivider(
              width: 4.h,
              thickness: 4.v,
              indent: 4.h,
              endIndent: 3.h,
            ),
          ),
          Container(
            height: 55.v,
            width: 159.h,
            margin: EdgeInsets.only(
              left: 17.h,
              top: 13.v,
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "msg_play_basket_ball".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 21.v,
                      right: 64.h,
                    ),
                    padding: EdgeInsets.all(9.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 14.adaptSize,
                          width: 14.adaptSize,
                          margin: EdgeInsets.only(top: 2.v),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgIconlyLightOu,
                                height: 14.adaptSize,
                                width: 14.adaptSize,
                                alignment: Alignment.center,
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgPath5,
                                height: 4.v,
                                width: 3.h,
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(
                                  top: 3.v,
                                  right: 3.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text(
                            "lbl_10_30_am".tr,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 34.v,
            width: 69.h,
            margin: EdgeInsets.only(
              top: 17.v,
              right: 3.h,
              bottom: 17.v,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 21.h,
              vertical: 7.v,
            ),
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgCheckmark,
              height: 19.v,
              width: 25.h,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
