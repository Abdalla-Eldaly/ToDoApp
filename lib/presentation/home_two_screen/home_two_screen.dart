import 'bloc/home_two_bloc.dart';
import 'models/home_two_model.dart';
import 'package:esayshop/core/app_export.dart';
import 'package:esayshop/widgets/app_bar/appbar_title.dart';
import 'package:esayshop/widgets/app_bar/custom_app_bar.dart';
import 'package:esayshop/widgets/custom_elevated_button.dart';
import 'package:esayshop/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class HomeTwoScreen extends StatelessWidget {
  const HomeTwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeTwoBloc>(
      create: (context) => HomeTwoBloc(HomeTwoState(
        homeTwoModelObj: HomeTwoModel(),
      ))
        ..add(HomeTwoInitialEvent()),
      child: HomeTwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: 365.h,
          margin: EdgeInsets.only(
            left: 20.h,
            top: 37.v,
            right: 27.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowDown,
                height: 13.v,
                width: 16.h,
              ),
              SizedBox(height: 57.v),
              Expanded(
                child: Container(
                  width: 352.h,
                  margin: EdgeInsets.only(left: 13.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 7.h,
                    vertical: 19.v,
                  ),
                  decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder15,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "lbl_edit_task".tr,
                        style: CustomTextStyles.titleMediumGray800,
                      ),
                      SizedBox(height: 52.v),
                      Padding(
                        padding: EdgeInsets.only(right: 6.h),
                        child: BlocSelector<HomeTwoBloc, HomeTwoState,
                            TextEditingController?>(
                          selector: (state) => state.thisIsTitleController,
                          builder: (context, thisIsTitleController) {
                            return CustomTextFormField(
                              controller: thisIsTitleController,
                              hintText: "lbl_this_is_title".tr,
                              textInputAction: TextInputAction.done,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 1.h),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 29.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "lbl_task_details".tr,
                          style: CustomTextStyles.titleLargeInterGray800,
                        ),
                      ),
                      SizedBox(height: 35.v),
                      Divider(
                        color: appTheme.gray600,
                        endIndent: 6.h,
                      ),
                      SizedBox(height: 27.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: Text(
                            "lbl_select_time".tr,
                            style: CustomTextStyles.titleLargeInterGray800,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.v),
                      Text(
                        "lbl_27_6_2021".tr,
                        style: theme.textTheme.bodyLarge,
                      ),
                      Spacer(
                        flex: 53,
                      ),
                      CustomElevatedButton(
                        text: "lbl_save_changes".tr,
                        margin: EdgeInsets.only(
                          left: 38.h,
                          right: 43.h,
                        ),
                      ),
                      Spacer(
                        flex: 46,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "lbl_to_do_list".tr,
        margin: EdgeInsets.only(
          left: 51.h,
          top: 28.v,
          bottom: 94.v,
        ),
      ),
      styleType: Style.bgFill,
    );
  }
}
