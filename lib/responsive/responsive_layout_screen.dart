import 'package:flutter/material.dart';
import 'package:threads_clone/utils/constants.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenlayout;
  final Widget mobileScreenlayout;

  const ResponsiveLayout(
      {Key? key,
      required this.webScreenlayout,
      required this.mobileScreenlayout})
      : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.webScreenlayout;
        } else {
          return widget.mobileScreenlayout;
        }
      }),
    );
  }
}
