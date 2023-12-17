import 'bloc/add_new_task_bloc.dart';
import 'models/add_new_task_model.dart';
import 'package:esayshop/core/app_export.dart';
import 'package:esayshop/presentation/home_page/home_page.dart';
import 'package:esayshop/widgets/app_bar/appbar_title.dart';
import 'package:esayshop/widgets/app_bar/custom_app_bar.dart';
import 'package:esayshop/widgets/custom_bottom_app_bar.dart';
import 'package:esayshop/widgets/custom_floating_button.dart';
import 'package:esayshop/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:table_calendar/table_calendar.dart';

class AddNewTaskScreen extends StatelessWidget {
  AddNewTaskScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddNewTaskBloc>(
      create: (context) => AddNewTaskBloc(AddNewTaskState(
        addNewTaskModelObj: AddNewTaskModel(),
      ))
        ..add(AddNewTaskInitialEvent()),
      child: AddNewTaskScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: 412.h,
          child: Column(
            children: [
              _buildFortySeven(context),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 45.v),
                    _buildNine(context),
                    Spacer(),
                    _buildThirtyThree(context),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigation(context),
        floatingActionButton: CustomFloatingButton(
          height: 60,
          width: 60,
          child: CustomImageView(
            imagePath: ImageConstant.imgCheckmarkOnprimarycontainer,
            height: 30.0.v,
            width: 30.0.h,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Section Widget
  Widget _buildFortySeven(BuildContext context) {
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
            child: BlocBuilder<AddNewTaskBloc, AddNewTaskState>(
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
  Widget _buildThirtyThree(BuildContext context) {
    return SizedBox(
      height: 366.v,
      width: 412.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 42.h,
                vertical: 21.v,
              ),
              decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "lbl_add_new_task".tr,
                    style: CustomTextStyles.titleMediumGray800,
                  ),
                  SizedBox(height: 39.v),
                  BlocSelector<AddNewTaskBloc, AddNewTaskState,
                      TextEditingController?>(
                    selector: (state) => state.enterTaskController,
                    builder: (context, enterTaskController) {
                      return CustomTextFormField(
                        controller: enterTaskController,
                        hintText: "lbl_enter_your_task".tr,
                        textInputAction: TextInputAction.done,
                      );
                    },
                  ),
                  SizedBox(height: 31.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "lbl_select_time".tr,
                      style: CustomTextStyles.titleLargeInterGray800,
                    ),
                  ),
                  SizedBox(height: 1.v),
                  Text(
                    "lbl_12_00_am".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 70.v),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 412.h,
              margin: EdgeInsets.only(top: 280.v),
              padding: EdgeInsets.symmetric(
                horizontal: 61.h,
                vertical: 28.v,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: fs.Svg(
                    ImageConstant.imgSubtraction1,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgGrid,
                    height: 21.v,
                    width: 26.h,
                    margin: EdgeInsets.symmetric(vertical: 3.v),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgClock,
                    height: 28.adaptSize,
                    width: 28.adaptSize,
                    margin: EdgeInsets.only(right: 5.h),
                  ),
                ],
              ),
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
