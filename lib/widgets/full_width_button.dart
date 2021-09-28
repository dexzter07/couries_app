import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/widgets/custom_inkwell.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FullWidthButton extends StatelessWidget {

  final String text;
  final Function onTap;
  final EdgeInsets margin;
  final bool noCurve;
  FullWidthButton({this.text,this.onTap,this.margin,this.noCurve});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.PrimaryColor,
          borderRadius: noCurve == true ? BorderRadius.circular(8) :  BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30),
          )
        ),
        padding: EdgeInsets.symmetric(vertical: 18),
        margin: margin?? EdgeInsets.only(bottom: 10),
        child: Center(child: CustomTextWidget(text,style: CustomTextStyle.boldMediumTextStyle(color: Colors.white),),),
      ),
    );
  }
}


class FullWidthButtonWithIcon extends StatelessWidget {

  final String title;
  final Icon icon;
  final Color color;
  final Function onTap;
  final BorderRadius borderRadius;
  final Border border;
  final EdgeInsets padding;
  final EdgeInsets maring;

  FullWidthButtonWithIcon({this.title,this.color,this.onTap,this.borderRadius,this.border,this.padding,this.maring,this.icon});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      child: Container(
        // width: Get.width,
        decoration: BoxDecoration(
            borderRadius: borderRadius == null ? BorderRadius.circular(12) : borderRadius,
            border:  border == null ? null : border ,
            color: color?? AppColors.PrimaryColor
        ),
        padding: padding ?? EdgeInsets.symmetric(vertical: 15),
        margin: maring ?? EdgeInsets.symmetric(horizontal: 0,vertical: 10),
        child:Row(
          children: [
            Spacer(),
            CustomTextWidget(title,style: CustomTextStyle.boldMediumTextStyle(color:border == null ? Colors.white : Colors.grey),),
            Spacer(),
            icon??Icon(Icons.navigate_next_outlined,color: Colors.white,),
            SizedBox(width: 10,)
          ],
        ),
      ),
    );
  }
}