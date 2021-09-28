import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/views/home/parcel/payment_success_view.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_checkbox.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:flutter/material.dart';


class OrderPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CustomAppBar(title: "Order Payment",),

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

                    SizedBox(height: 10,),
                    CustomTextWidget("Payment Mode",style: CustomTextStyle.boldMediumTextStyle(),),
                    SizedBox(height: 10,),

                    Row(
                      children: [
                        CustomCheckBox(isSelected: true,),
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget("Cash on delivery",style: CustomTextStyle.smallTextStyle1(),),
                            CustomTextWidget("Pay with pick a Pickup",style: CustomTextStyle.smallTextStyle1(),),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20,),

                    CustomTextWidget("Credit Card",style: CustomTextStyle.boldMediumTextStyle(),),
                    SizedBox(height: 20,),

                    CustomRow(title1: "Service Fee",title2: "\$128",),
                    CustomRow(title1: "Late Night Charge",title2: "\$128",),
                    CustomRow(title1: "Moving Cart ",title2: "\$128",title3: "Additional Services",),
                    CustomRow(title1: "Discount",title2: "\$128",title3: "Promo Code: 554dffd",),

                    SizedBox(height: 20,),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        CustomTextWidget("Total",style: CustomTextStyle.smallTextStyle1(color: Colors.grey),),
                        Spacer(),
                        CustomTextWidget("\$124.67",style: CustomTextStyle.boldTextStyle(color: AppColors.PrimaryColor),)
                      ],
                    ),

                  ],
                ),
              ),
            ),

            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left:20,right: 20,top: 0,bottom: 0),
              child: FullWidthButtonWithIcon(
                title: "Order Now",
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>PaymentSuccessScreen()));
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}



class CustomRow extends StatelessWidget {

  final String title1;
  final String title2;
  final String title3;
  CustomRow({this.title2,this.title1,this.title3});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          title3 == null ? Expanded(child: CustomTextWidget(title1,style: CustomTextStyle.boldMediumTextStyle(),)) :
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(title1,style: CustomTextStyle.boldMediumTextStyle(),),
                CustomTextWidget(title3,style: CustomTextStyle.smallTextStyle1(color: Colors.grey),)
              ],
            ),
          ),
          CustomTextWidget(title2,style: CustomTextStyle.smallTextStyle1(),)
        ],
      ),
    );
  }
}
