import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 601 &&
      MediaQuery.of(context).size.width <= 992;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 992;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width > 992) {
      return OverflowBox(
        maxWidth: double.infinity,
        alignment: Alignment.topCenter,
        child: desktop,
      );
    } else if (size.width >= 576 && tablet != null) {
      return OverflowBox(
        maxWidth: double.infinity,
        alignment: Alignment.topCenter,
        child: tablet!,
      );
    } else {
      return mobile;
    }
  }
}
