import 'package:flutter/material.dart';
import 'colors.dart';

extension ContextExt on BuildContext {
  double get height {
    return MediaQuery.sizeOf(this).height;
  }

  double get width {
    return MediaQuery.sizeOf(this).width;
  }

  bool get isTablet {
    return MediaQuery.sizeOf(this).width > 600;
  }

  Future<void> push(String route, [Object? arguments]) async {
    Navigator.of(this).pushNamed(route, arguments: arguments);
  }

  Future<void> replace(String route, [Object? arguments]) async {
    await Navigator.of(this).pushReplacementNamed(route, arguments: arguments);
  }

  Future<void> replaceAll(String route, [Object? arguments]) async {
    while (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
    await Navigator.of(this).pushReplacementNamed(route, arguments: arguments);
  }

  Future<void> pop([bool? result]) async {
    return Navigator.of(this).pop(result);
  }

  bool get canPop => Navigator.of(this).canPop();

  //! TextStyles
  TextStyle get normal10 {
    return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  TextStyle get normal16 {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  TextStyle get regular10 {
    return const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    );
  }

  TextStyle get regular12 {
    return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    );
  }

  TextStyle get bold16 {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  TextStyle get bold24 {
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
      letterSpacing: 1.1,
    );
  }

  TextStyle get bold32 {
    return const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
      letterSpacing: 1.1,
    );
  }

  TextStyle get bold20 {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
      letterSpacing: 1.1,
    );
  }

  TextStyle get regular14 {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.3,
      color: AppColors.white,
    );
  }

  TextStyle get regular16 {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    );
  }
}
