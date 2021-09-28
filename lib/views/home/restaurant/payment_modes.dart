import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/views/home/restaurant/order_payment_view.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_checkbox.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:flutter/material.dart';

class PaymentModeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "Payment Modes",),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color:AppColors.backgroundColor,
                    borderRadius: ContainerDecor.BorderRadius1
                ),
                padding:  AppConstants.screenPadding,
                child: Column(
                  children: [
                    CustomWidget(title1: 'Cash on Pickup',title2: "Pay with pick a Pickup",),
                    CustomWidget(title1: 'Cash on Delivery',title2: "Pay with pick a Pickup",isSelected: true,),
                    CustomWidget(title1: 'Paypal',title2: "Pay from PayPal Account",),
                    CustomWidget(title1: 'Stripe',title2: "Pay from Stripe Account",),

                  ],
                ),
              ),
            ),

            Container(
              color: AppColors.backgroundColor,
              padding: EdgeInsets.only(left:20,right: 20,top: 0,bottom: 0),
              child: FullWidthButtonWithIcon(
                title: "NEXT",
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderPaymentScreen()));
                },
              ),
            )
          ],
        ),
      ));
  }
}



class CustomWidget extends StatelessWidget {

  final String title1;
  final String title2;
  final bool isSelected;
  CustomWidget({this.isSelected,this.title2,this.title1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13),
      child: Row(
        children: [
          CustomCheckBox(isSelected: isSelected ?? false,),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(title1,style: CustomTextStyle.boldMediumTextStyle(),),
              CustomTextWidget(title2,style: CustomTextStyle.smallTextStyle1(),)
            ],
          )
        ],
      ),
    );
  }
}
