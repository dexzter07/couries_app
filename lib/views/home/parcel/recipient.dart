import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/views/home/parcel/order_details.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_text_field.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RecipientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Column(
          children: [

            CustomAppBar(title: "Recipient",),

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
                    Image.asset("assets/images/box.png",height: Get.height*0.25,),
                    SizedBox(height: 20,),

                    CustomColumnWithTextField(title: "Name",hintText: "",),
                    CustomColumnWithTextField(title: "Phone Number or Email",hintText: "",),
                    CustomColumnWithTextField(title: "Block/Floor/Room/Order ID/Others",hintText: "",),
                    SizedBox(height: 20,),

                    FullWidthButtonWithIcon(
                      title: "Next",
                      onTap: (){
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDetailsScreen()));
                      },
                    )
                  ],
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
}





class CustomColumnWithTextField extends StatelessWidget {

  final String title;
  final String hintText;
  final int maxLines;
  CustomColumnWithTextField({this.title,this.hintText,this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CustomTextWidget(title,style: CustomTextStyle.smallBoldTextStyle1(),),
        SizedBox(height: 10,),

        CustomTextField(hintText: hintText,),
        SizedBox(height: 20,),

      ],
    );
  }
}