// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ConstrainedScaffold extends StatelessWidget {
  final Color? backgroundColor;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  const ConstrainedScaffold({
    super.key,
    this.backgroundColor,
    required this.body,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        drawer: drawer,
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 430,
            ),
            child: body,
          ),
        ),
        bottomNavigationBar: bottomNavigationBar
        // ConstrainedBox(
        //   constraints: const BoxConstraints(
        //     maxWidth: 430,
        //   ),
        //   child: ,
        // ),
        );
  }
}
