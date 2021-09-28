import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/views/home/restaurant/payment_modes.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:flutter/material.dart';


class ConfirmInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "Confirm Info",),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color:AppColors.backgroundColor,
                    borderRadius: ContainerDecor.BorderRadius1
                ),
                padding:  AppConstants.screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(),

                    CustomTextWidget("Restaurant",style: CustomTextStyle.smallTextStyle1(),),
                    SizedBox(height: 5,),
                    CustomTextWidget("Silver Green Restaurant",style: CustomTextStyle.boldMediumTextStyle(),),
                    SizedBox(height: 5,),
                    CustomTextWidget("128 Mott St, New Yorl, NY 10013, United States",style: CustomTextStyle.ultraSmallBoldTextStyle(),),
                    SizedBox(height: 30,),

                    CustomTextWidget("City Garden",style: CustomTextStyle.smallTextStyle1(),),
                    SizedBox(height: 5,),
                    CustomTextWidget("Silver Green Restaurant",style: CustomTextStyle.boldMediumTextStyle(),),
                    SizedBox(height: 5,),
                    CustomTextWidget("128 Mott St, New Yorl, NY 10013, United States",style: CustomTextStyle.ultraSmallBoldTextStyle(),),
                    SizedBox(height: 30,),

                    CustomTextWidget("Distance",style: CustomTextStyle.smallTextStyle1(),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        CustomTextWidget("24.2 km",style: CustomTextStyle.boldMediumTextStyle(),),
                        Spacer(),
                        CustomTextWidget("View in Map",style: CustomTextStyle.smallBoldTextStyle1(color: AppColors.PrimaryColor),),
                      ],
                    ),
                    SizedBox(height: 30,),

                    CustomTextWidget("Food Items",style: CustomTextStyle.smallTextStyle1(),),
                    SizedBox(height: 5,),
                    CustomRow(name: "Veg Sandwich",quantity: '1',),
                    CustomRow(name: "FarmVilla Piazza",quantity: '3',),
                    CustomRow(name: "Chicken Soup",quantity: '1',),
                    SizedBox(height: 30,),

                    CustomTextWidget("Additional Information",style: CustomTextStyle.smallTextStyle1(),),
                    SizedBox(height: 5,),
                    CustomTextWidget("Make Less spicy with less gravy.",style: CustomTextStyle.smallBoldTextStyle1(),),
                    SizedBox(height: 30,),

                    CustomTextWidget("Delivery Mode ",style: CustomTextStyle.smallTextStyle1(),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        CustomTextWidget("Economy Delivery.",style: CustomTextStyle.smallBoldTextStyle1(),),
                        Spacer(),
                        CustomTextWidget("8.60",style: CustomTextStyle.smallBoldTextStyle1(),),
                      ],
                    ),
                    SizedBox(height: 30,),

                    FullWidthButtonWithIcon(
                      title: "PROCEED TO PAYMENT",
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentModeScreen()));

                      },
                    )
                  ],
                )
                ),
            )
          ],
        ),
      ),
    );
  }
}



class CustomRow extends StatelessWidget {

  final String name;
  final String quantity;
  CustomRow({this.name,this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:3),
      child: Row(
        children: [
          CustomTextWidget(name,style: CustomTextStyle.smallBoldTextStyle1(),),
          Spacer(),
          CustomTextWidget(quantity,style: CustomTextStyle.smallBoldTextStyle1(),),

        ],
      ),
    );
  }
}
