
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_inkwell.dart';

class CustomDrawer extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/Vector.png",fit: BoxFit.cover,width: double.infinity,),
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user2.jpg"),
                    radius: 40,
                  ),
                  SizedBox(height: 10,),
                  Text("Himalayan Das",style: CustomTextStyle.boldMediumTextStyle(color: Colors.white,fontFamily: "PoppinsRegular"),)
                ],
              )
            ],
          ),
          SizedBox(height: Get.height*0.08,),

          CustomInkWell(
              onTap: (){
               },
              child: CustomRow(title: "Place Order",icon: Icon(Icons.shopping_cart,color: AppColors.PrimaryColor,),)
          ),
          CustomInkWell(
              onTap: (){
                },
              child: CustomRow(title: "My Orders",icon: Icon(Icons.history,color: AppColors.PrimaryColor,),)
          ),
          CustomInkWell(
              onTap: (){},
              child: CustomRow(title: "Notification",icon: Icon(Icons.notifications_none,color: AppColors.PrimaryColor,),)),
          CustomRow(title: "Help \& Feedback",icon: Icon(Icons.chat,color: AppColors.PrimaryColor,),),
          CustomRow(title: "Settings",icon: Icon(Icons.settings,color: AppColors.PrimaryColor,),)


        ],
      )
    );
  }
}



class CustomRow extends StatelessWidget {

  final String title;
  final Icon icon;

  CustomRow({this.icon,this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              icon,
              SizedBox(width: 20,),
              Text(title,style: CustomTextStyle.mediumTextStyle(),)
            ],
          ),
        ],
      ),
    );
  }
}
