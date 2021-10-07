
import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/views/home/parcel/track_order.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';



class OrderDetailsAfterOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,

      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "Order Details",),

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
                    Container(
                      decoration: BoxDecoration(
                        color:AppColors.primaryDarkBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/svgs/time.svg"),
                          SizedBox(width: 30,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(" 2021",style: CustomTextStyle.smallBoldTextStyle1(color: Colors.white,),),
                              SizedBox(height:2),
                              Text("Fri, Feb 12",style: CustomTextStyle.boldTextStyle(color: Colors.white),),
                              SizedBox(height: 5,),
                              Text("11:12 PM",style: CustomTextStyle.boldTextStyle(color: Colors.white),)
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Container(height:15,width: 15, child: Icon(Icons.circle,color: Colors.grey,size: 15,)),
                        SizedBox(width: 8,),
                        Text("Shar Tau Tok",style:  CustomTextStyle.smallTextStyle1(color: Colors.grey),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(height:15,width: 15,child:Image.asset("assets/images/location1.png")),
                        SizedBox(width: 8,),
                        Text("Fanling",style:  CustomTextStyle.smallTextStyle1(color: Colors.grey))
                      ],
                    ),

                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(0.2),offset: Offset(3,3), blurRadius: 5,spreadRadius: 3),
                          ]
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 12),
                      margin: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Recipient info",style: CustomTextStyle.smallBoldTextStyle1(),),
                              Spacer(),
                              Text("#25556",style: CustomTextStyle.smallBoldTextStyle1(),)
                            ],
                          ),
                          SizedBox(height: 10,),

                          Text("Himalayan Das",style: CustomTextStyle.ultraSmallTextStyle(),),
                          SizedBox(height: 3,),
                          SizedBox(height: 3,),
                          Text("1+ 00000 00000",style: CustomTextStyle.ultraSmallTextStyle(),),
                          SizedBox(height: 3,),
                          Text("A Block 2nd flow Room 251",style: CustomTextStyle.ultraSmallTextStyle(),)
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),


                    Row(
                      children: [
                        Text("Late Night Subcharges",style: CustomTextStyle.smallBoldTextStyle1(),),
                        Spacer(),
                        Text("\$50",style: CustomTextStyle.smallBoldTextStyle1(),)
                      ],
                    ),
                    SizedBox(height: 10,),

                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Moving Cart",style: CustomTextStyle.smallBoldTextStyle1(),),
                            Text("Additional Services",style: CustomTextStyle.ultraSmallTextStyle(color: Colors.grey),),
                          ],
                        ),
                        Spacer(),
                        Text("\$20",style: CustomTextStyle.smallBoldTextStyle1(),)
                      ],
                    ),
                    SizedBox(height: 10,),

                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Discount",style: CustomTextStyle.smallBoldTextStyle1(),),
                            Text("Promo code : 545dfrggX",style: CustomTextStyle.ultraSmallTextStyle(color: Colors.grey),),
                          ],
                        ),
                        Spacer(),
                        Text("\$20",style: CustomTextStyle.smallBoldTextStyle1(color: AppColors.PrimaryColor),)
                      ],
                    ),
                    SizedBox(height: 10,),

                    Divider(color: Colors.grey.withOpacity(0.4),thickness: 1,),

                    Row(
                      children: [
                        Text("Total",style: CustomTextStyle.smallBoldTextStyle1(),),
                        Spacer(),
                        Text("\$124.67",style: CustomTextStyle.boldTextStyle(color: AppColors.PrimaryColor),)
                      ],
                    ),


                    SizedBox(height: 30,),
                    FullWidthButton(
                      noCurve: true,
                      text:"Track Order",
                      onTap: (){
                        FocusScope.of(context).unfocus();
                        Get.to(ParcelHomeScreen());
                      },
                    ),
                    // FullWidthButton(
                    //   text: "Order Again",
                    //
                    //   onTap: (){
                    //     FocusScope.of(context).unfocus();
                    //
                    //   },
                    // )
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
