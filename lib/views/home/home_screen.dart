import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/views/home/parcel/place_order_view.dart';
import 'package:couries_one/views/home/restaurant/place_order_view.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_inkwell.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "CouriesOne",),
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
                    HomeScreenWidget(imageUrl: "assets/images/parcel.jpg",title1: "Arrange Delivery",title2: "Arrange Delivery delivery of anything, anytime & anywhere",onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context){return PlaceOrderScreen();}));},),
                    HomeScreenWidget(imageUrl: "assets/images/food.jpg",title1: "Get Food Delivered",title2: "Arrange Delivery delivery of anything, anytime & anywhere",onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context){return PlaceOrderScreenForRestaurant();}));},),
                    HomeScreenWidget(imageUrl: "assets/images/grocery8.png",title1: "Get Grocery Delivered",title2: "Arrange Delivery delivery of anything, anytime & anywhere",onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context){return PlaceOrderScreenForRestaurant();}));},),


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



class HomeScreenWidget extends StatelessWidget {

  final String imageUrl;
  final String title1;
  final String title2;
  final Function onTap;
  HomeScreenWidget({this.imageUrl, this.title1, this.title2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [ContainerDecor.customBoxShadow]
        ),
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 12),
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(imageUrl,height: 70,width: 60,fit: BoxFit.cover,)
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(title1,style: CustomTextStyle.smallBoldTextStyle1(),),
                  SizedBox(height: 5,),
                  CustomTextWidget(title2,style: CustomTextStyle.ultraSmallTextStyle(),alignText: false,)
                ],
              ),
            ),
            SizedBox(width: 15,),
            Icon(Icons.navigate_next_sharp,size: 30,color: Colors.grey,)
          ],
        ),
      ),
    );
  }


}
