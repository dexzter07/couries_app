import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {

  final Function onTap;
  final Widget child;
  CustomInkWell({this.onTap,this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
