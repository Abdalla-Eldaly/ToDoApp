import 'bloc/task_done_bloc.dart';
import 'models/task_done_model.dart';
import 'package:esayshop/core/app_export.dart';
import 'package:esayshop/presentation/home_page/home_page.dart';
import 'package:esayshop/widgets/app_bar/appbar_title.dart';
import 'package:esayshop/widgets/app_bar/custom_app_bar.dart';
import 'package:esayshop/widgets/custom_bottom_app_bar.dart';
import 'package:esayshop/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TaskDoneScreen extends StatelessWidget {
  TaskDoneScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<TaskDoneBloc>(
      create: (context) => TaskDoneBloc(TaskDoneState(
        taskDoneModelObj: TaskDoneModel(),
      ))
        ..add(TaskDoneInitialEvent()),
      child: TaskDoneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 412.h,
          child: Column(
            children: [
              _buildFiftyFive(context),
              SizedBox(height: 45.v),
              _buildNine(context),
              Spacer(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigation(context),
        floatingActionButton: CustomFloatingButton(
          height: 60,
          width: 60,
          child: CustomImageView(
            imagePath: ImageConstant.imgFloatingIcon,
            height: 30.0.v,
            width: 30.0.h,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Section Widget
  Widget _buildFiftyFive(BuildContext context) {
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
            child: BlocBuilder<TaskDoneBloc, TaskDoneState>(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 69.v,
            child: VerticalDivider(
              width: 4.h,
              thickness: 4.v,
              color: appTheme.green400,
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
                    style: CustomTextStyles.titleMediumGreen400,
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
          Padding(
            padding: EdgeInsets.only(
              top: 16.v,
              right: 15.h,
              bottom: 19.v,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "lbl_done2".tr,
                    style: CustomTextStyles.titleLargeGreen400,
                  ),
                  TextSpan(
                    text: "lbl".tr,
                    style: CustomTextStyles.titleLargeGreen400_1,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomNavigation(BuildContext context) {
    return CustomBottomAppBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Grid:
        return "/";
      case BottomBarEnum.Search:
        return AppRoutes.homePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      default:
        return DefaultWidget();
    }
  }
}
