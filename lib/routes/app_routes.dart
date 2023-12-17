import 'package:flutter/material.dart';
import 'package:esayshop/presentation/splash_screen/splash_screen.dart';
import 'package:esayshop/presentation/home_container_screen/home_container_screen.dart';
import 'package:esayshop/presentation/task_done_screen/task_done_screen.dart';
import 'package:esayshop/presentation/task_delete_screen/task_delete_screen.dart';
import 'package:esayshop/presentation/add_new_task_screen/add_new_task_screen.dart';
import 'package:esayshop/presentation/settings_screen/settings_screen.dart';
import 'package:esayshop/presentation/home_two_screen/home_two_screen.dart';
import 'package:esayshop/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String taskDoneScreen = '/task_done_screen';

  static const String taskDeleteScreen = '/task_delete_screen';

  static const String addNewTaskScreen = '/add_new_task_screen';

  static const String settingsScreen = '/settings_screen';

  static const String homeTwoScreen = '/home_two_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        homeContainerScreen: HomeContainerScreen.builder,
        taskDoneScreen: TaskDoneScreen.builder,
        taskDeleteScreen: TaskDeleteScreen.builder,
        addNewTaskScreen: AddNewTaskScreen.builder,
        settingsScreen: SettingsScreen.builder,
        homeTwoScreen: HomeTwoScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
