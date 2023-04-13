import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'package:newcase/styles/styles.dart';

/// App page use almost in any screen
class AppPage extends StatelessWidget {
  /// App Page
  const AppPage({
    key,
    this.scaffoldKey,
    this.appBarTitle = '',
    this.onBackPressed,
    required this.body,
    this.drawer,
    this.endDrawer,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.appBarLeadingWidget,
    this.appBarActions,
    this.appBarLeadingWidth,
    this.bodyColor,
    this.resizeToAvoidBottomInset,
  }): super(key: key);

  /// Title of app bar
  final String? appBarTitle;

  /// Action app bar
  final List<Widget>? appBarActions;

  /// On back
  final VoidCallback? onBackPressed;

  /// leading widget
  final Widget? appBarLeadingWidget;

  /// Width of app bar
  final double? appBarLeadingWidth;

  /// Body
  final Widget body;

  /// endDrawer
  final Widget? endDrawer;

  /// drawer

  final Widget? drawer;

  /// floatingActionButton
  final Widget? floatingActionButton;

  /// bottomNavigationBar
  final Widget? bottomNavigationBar;

  /// body color
  final Color? bodyColor;

  /// scaffoldKey
  final Key? scaffoldKey;

  /// If true the [body] and the scaffold's floating widgets should size
  /// themselves to avoid the onscreen keyboard whose height is defined by the
  /// ambient [MediaQuery]'s [MediaQueryData.viewInsets] `bottom` property.
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// scaffold, the body can be resized to avoid overlapping the keyboard, which
  /// prevents widgets inside the body from being obscured by the keyboard.
  ///
  /// Defaults to true
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      // resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      // key: scaffoldKey,
      name: appBarTitle ?? '',
      

      // appBar: MPAppBar(
      //   // elevation: 0,
      //   // backgroundColor: $style.colors.neutral50,
      //   // title: Text(
      //   //   appBarTitle ?? '',
      //   //   style: $style.texts.calloutBold.copyWith(
      //   //     color: $style.colors.neutral400,
      //   //   ),
      //   // ),
      //   // leading: appBarLeadingWidget ??
      //   //     AppBackButton(
      //   //       onBackPressed: onBackPressed,
      //   //     ),
      //   // leadingWidth: appBarLeadingWidth,
      //   // actions: appBarActions,
      //   // centerTitle: true, 
      //   context: context,
      // ),
      // drawer: drawer,
      // endDrawer: endDrawer,
      floatingBody: floatingActionButton,
      bottomBar: bottomNavigationBar,
      backgroundColor: bodyColor ?? $style.colors.neutral50,
      body: body,
    );
  }
}
