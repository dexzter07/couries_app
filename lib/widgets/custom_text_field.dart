import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  final Function validator;
  CustomTextField({this.controller,this.hintText,this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      margin: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: ContainerDecor.TextFieldBorderRadius,
        color: Colors.white,
        boxShadow: [
          ContainerDecor.customBoxShadow
        ]

      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: CustomTextStyle.mediumTextStyle(),
            errorMaxLines: 1,
            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
            isDense: true,
            errorStyle: CustomTextStyle.ultraSmallTextStyle(color: Colors.red),
            enabledBorder: OutlineInputBorder(borderRadius: ContainerDecor.TextFieldBorderRadius,borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(borderRadius: ContainerDecor.TextFieldBorderRadius,borderSide: BorderSide(color: Colors.white)),
            errorBorder: OutlineInputBorder(borderRadius: ContainerDecor.TextFieldBorderRadius,borderSide: BorderSide(color: Colors.white)),
            focusedErrorBorder: OutlineInputBorder(borderRadius: ContainerDecor.TextFieldBorderRadius,borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}



class CustomTextField1 extends StatelessWidget {

  final String hintText;
  final EdgeInsets margin;
  final TextEditingController controller;
  final Function validator;
  final TextStyle hintStyle;
  final bool hideBorder;
  final bool showNumPad;
  final int maxLength;
  CustomTextField1({this.controller,this.hintText,this.validator,this.hintStyle,this.hideBorder,this.margin,this.showNumPad,this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 0,vertical: 5),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLength: maxLength ?? null,
        keyboardType: showNumPad == true ? TextInputType.number : null,
        decoration: InputDecoration(
          counterText: "",
          hintText: hintText,
          hintStyle: hintStyle ?? CustomTextStyle.mediumTextStyle(),
          errorMaxLines: 1,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
          errorStyle: CustomTextStyle.ultraSmallTextStyle(color: Colors.red),
          enabledBorder: hideBorder == true ? InputBorder.none : OutlineInputBorder(borderRadius: ContainerDecor.TextFieldBorderRadius,borderSide: BorderSide(color: Colors.white)),
          focusedBorder: hideBorder == true ? InputBorder.none : OutlineInputBorder(borderRadius: ContainerDecor.TextFieldBorderRadius,borderSide: BorderSide(color: Colors.white)),
          errorBorder: hideBorder == true ? InputBorder.none : OutlineInputBorder(borderRadius: ContainerDecor.TextFieldBorderRadius,borderSide: BorderSide(color: Colors.white)),
          focusedErrorBorder: hideBorder == true ? InputBorder.none : OutlineInputBorder(borderRadius: ContainerDecor.TextFieldBorderRadius,borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}
