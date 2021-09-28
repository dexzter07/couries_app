import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  final String title;
  CustomAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.PrimaryColor,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(child: CustomTextWidget(title,style: CustomTextStyle.boldTextStyle(color: Colors.white)),),
    );
  }
}
