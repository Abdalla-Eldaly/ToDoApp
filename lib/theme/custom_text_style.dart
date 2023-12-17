import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumPoppinsOnError =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: theme.colorScheme.onError,
      );
  // Title text style
  static get titleLargeGreen400 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.green400,
      );
  static get titleLargeGreen400_1 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.green400,
      );
  static get titleLargeGreen400_2 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.green400,
      );
  static get titleLargeInterGray800 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.gray800,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeInterSecondaryContainer =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleMediumGray800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray800,
      );
  static get titleMediumGreen400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.green400,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}
