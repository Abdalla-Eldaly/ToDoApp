import 'bloc/splash_bloc.dart';
import 'models/splash_model.dart';
import 'package:esayshop/core/app_export.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) =>
            SplashBloc(SplashState(splashModelObj: SplashModel()))
              ..add(SplashInitialEvent()),
        child: SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: 412.h,
                  child: Column(children: [
                    Spacer(flex: 60),
                    CustomImageView(
                        imagePath: ImageConstant.imgLogo,
                        height: 211.v,
                        width: 189.h),
                    Spacer(flex: 39)
                  ])),
              bottomNavigationBar: _buildSupervisedByMohamed(context)));
    });
  }

  /// Section Widget
  Widget _buildSupervisedByMohamed(BuildContext context) {
    return Container(
        height: 128.v,
        width: 213.h,
        margin: EdgeInsets.only(left: 2.h),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          CustomImageView(
              imagePath: ImageConstant.imgRouteBlue,
              height: 128.adaptSize,
              width: 128.adaptSize,
              alignment: Alignment.center),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 15.v),
                  child: Text("msg_supervised_by_mohamed".tr,
                      style: CustomTextStyles.bodyMediumPoppinsOnError)))
        ]));
  }
}
