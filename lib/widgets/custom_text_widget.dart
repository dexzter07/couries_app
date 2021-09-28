import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {

  final String text;
  final TextStyle style;
  final bool alignText;
  CustomTextWidget(this.text,{this.style,this.alignText});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: style,textScaleFactor: 0.87,textAlign: alignText==true? TextAlign.center : null,);
  }
}
