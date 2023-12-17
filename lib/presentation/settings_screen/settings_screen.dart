import 'bloc/settings_bloc.dart';
import 'models/settings_model.dart';
import 'package:esayshop/core/app_export.dart';
import 'package:esayshop/presentation/home_page/home_page.dart';
import 'package:esayshop/widgets/app_bar/appbar_title.dart';
import 'package:esayshop/widgets/app_bar/custom_app_bar.dart';
import 'package:esayshop/widgets/custom_bottom_app_bar.dart';
import 'package:esayshop/widgets/custom_drop_down.dart';
import 'package:esayshop/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(SettingsState(
        settingsModelObj: SettingsModel(),
      ))
        ..add(SettingsInitialEvent()),
      child: SettingsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: 412.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 30.v),
              _buildSeventeen(context),
              SizedBox(height: 22.v),
              _buildFifteen(context),
              Spacer(),
              _buildSixty(context),
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
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "lbl_settings".tr,
        margin: EdgeInsets.only(
          left: 51.h,
          top: 31.v,
          bottom: 91.v,
        ),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildSeventeen(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 37.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Text(
              "lbl_language".tr,
              style: theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 18.v),
          Padding(
            padding: EdgeInsets.only(left: 19.h),
            child: BlocSelector<SettingsBloc, SettingsState, SettingsModel?>(
              selector: (state) => state.settingsModelObj,
              builder: (context, settingsModelObj) {
                return CustomDropDown(
                  icon: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 19.v, 16.h, 19.v),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgArrowdownPrimary,
                      height: 10.adaptSize,
                      width: 10.adaptSize,
                    ),
                  ),
                  hintText: "lbl_english".tr,
                  alignment: Alignment.centerRight,
                  items: settingsModelObj?.dropdownItemList ?? [],
                  onChanged: (value) {
                    context
                        .read<SettingsBloc>()
                        .add(ChangeDropDownEvent(value: value));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFifteen(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 37.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Text(
              "lbl_mode".tr,
              style: theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 20.v),
          Padding(
            padding: EdgeInsets.only(left: 19.h),
            child: BlocSelector<SettingsBloc, SettingsState, SettingsModel?>(
              selector: (state) => state.settingsModelObj,
              builder: (context, settingsModelObj) {
                return CustomDropDown(
                  icon: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 19.v, 16.h, 19.v),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgArrowdownPrimary,
                      height: 10.adaptSize,
                      width: 10.adaptSize,
                    ),
                  ),
                  hintText: "lbl_light".tr,
                  alignment: Alignment.centerRight,
                  items: settingsModelObj?.dropdownItemList1 ?? [],
                  onChanged: (value) {
                    context
                        .read<SettingsBloc>()
                        .add(ChangeDropDown1Event(value: value));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSixty(BuildContext context) {
    return Container(
      width: 412.h,
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
