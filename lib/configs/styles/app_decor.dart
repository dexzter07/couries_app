import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerDecor {

  static const BorderRadius BorderRadius1 = BorderRadius.only(topLeft: Radius.circular(40));
  static const BorderRadius TextFieldBorderRadius = BorderRadius.all(Radius.circular(12));

  static BoxShadow customBoxShadow = BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
  );

}

