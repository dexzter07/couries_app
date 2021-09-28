import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_checkbox.dart';
import 'package:couries_one/widgets/custom_inkwell.dart';
import 'package:couries_one/widgets/custom_text_field.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class SearchRestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "Search Restaurant",),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color:AppColors.backgroundColor,
                    borderRadius: ContainerDecor.BorderRadius1
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/map.png"),
                      fit: BoxFit.fill
                    )
                  ),
                  padding:  AppConstants.screenPadding,
                  child: Column(
                    children: [

                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search,size: 20,),
                              SizedBox(width: 10,),
                              Expanded(child: CustomTextField1(
                                hintText: "Search Location",
                              ))
                            ],
                          )
                      ),
                      SizedBox(height: 20,),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget("Recent Searches",style: CustomTextStyle.smallBoldTextStyle1(),),
                            SizedBox(height: 10,),
                            CustomCheckBoxAndTextWidget(title: "Silver Green Restaurant",),
                            CustomCheckBoxAndTextWidget(title: "Global China Restaurant",),
                            CustomCheckBoxAndTextWidget(title: "China Restaurant",)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class CustomCheckBoxAndTextWidget extends StatelessWidget {

  final String title;
  CustomCheckBoxAndTextWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: CustomInkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Row(
          children: [
            CustomCheckBox(isSelected: false,borderColor: Colors.grey,onTap: (){Navigator.pop(context);},),
            SizedBox(width: 10,),
            Expanded(child: CustomTextWidget(title,style: CustomTextStyle.smallTextStyle1(),),)
          ],
        ),
      ),
    );
  }
}

