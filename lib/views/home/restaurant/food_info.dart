import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/views/home/restaurant/confirm_info.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_checkbox.dart';
import 'package:couries_one/widgets/custom_text_field.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:flutter/material.dart';

class FoodInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "Food Info",),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color:AppColors.backgroundColor,
                    borderRadius: ContainerDecor.BorderRadius1
                ),
                padding:  AppConstants.screenPadding,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    CustomTextWidget("Add Food items & Quantity",style: CustomTextStyle.boldMediumTextStyle(),),
                    SizedBox(height: 10,),
                    
                    CustomAddItemWidget(),
                    CustomAddItemWidget(),
                    CustomAddItemWidget(),
                    SizedBox(height: 20,),
                    
                    CustomTextWidget("Delivery Mode",style: CustomTextStyle.boldMediumTextStyle(),),
                    SizedBox(height: 10,),

                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [ContainerDecor.customBoxShadow]
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
                      child: Row(
                        children: [
                          Expanded(child: CustomTextWidget("Economy Delivery",style: CustomTextStyle.smallTextStyle1(),)),
                          SizedBox(width: 10,),
                          CustomTextWidget("\$ 8.60",style: CustomTextStyle.smallBoldTextStyle1(),)
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),

                    CustomCheckboxAndTextWidget(title: "Will delivery which food are available at restaurant.",),
                    CustomCheckboxAndTextWidget(title: "Delivery man will call to confirm total bill amount.",),
                    CustomCheckboxAndTextWidget(title: "Delivery Charges are non-refundable.",),
                    SizedBox(height: 20,),


                    FullWidthButtonWithIcon(
                      title: "CONTINUE",
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConfirmInfoScreen()));

                      },
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class CustomAddItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [ContainerDecor.customBoxShadow]
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Flexible(
              flex: 3,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                  child: CustomTextField1(
                    margin: EdgeInsets.zero,
                    hintText: "Add Item",hintStyle: CustomTextStyle.mediumTextStyle(color: Colors.grey),)
              )),
          Flexible(
              flex:1,
              child:Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFEDEDED)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                  child: CustomTextField1(
                    showNumPad: true,
                    maxLength: 3,
                    margin: EdgeInsets.zero,
                    hideBorder:true,hintText: "Qnt",hintStyle: CustomTextStyle.mediumTextStyle(color: Colors.grey),)
              )
          )
        ],
      ),
    );
  }
}


class CustomCheckboxAndTextWidget extends StatelessWidget {
  final String title;
  CustomCheckboxAndTextWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCheckBox(isSelected: false,borderColor: Colors.grey,onTap: (){},),
          SizedBox(width: 20,),
          Expanded(child: CustomTextWidget(title,style: CustomTextStyle.smallTextStyle1(),),)
        ],
      ),
    );
  }
}

