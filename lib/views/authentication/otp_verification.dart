import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/controllers/authentication/otp_controller.dart';
import 'package:couries_one/views/bottom_nav_bar.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:couries_one/widgets/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatelessWidget {

  final OtpController _otpController = Get.put(OtpController());
  GlobalKey<FormState> _otpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Form(
          key: _otpKey,
          child: Column(
            children: [
              AppBarWidget(),
              Expanded(
                child: Container(
                  padding: AppConstants.screenPadding,
                  decoration: BoxDecoration(
                    borderRadius: ContainerDecor.BorderRadius1,
                    color: AppColors.backgroundColor
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [

                        Align(
                            alignment: Alignment.centerLeft,
                            child: CustomTextWidget("  Enter OTP",style: CustomTextStyle.boldMediumTextStyle(),)
                        ),
                      SizedBox(height: 30,),

                      CustomTextWidget("Enter 6 DIGIT verification code",style: CustomTextStyle.smallTextStyle1(color: Colors.grey),),
                      SizedBox(height:30,),

                      Obx((){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [

                              Expanded(child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: OtpTextField(controller: _otpController.otpController1.value,count: 1,)),
                              ),
                              Expanded(child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: OtpTextField(controller: _otpController.otpController2.value,count: 2,)),
                              ),
                              Expanded(child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: OtpTextField(controller: _otpController.otpController3.value,count: 3,)),
                              ),
                              Expanded(child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: OtpTextField(controller: _otpController.otpController4.value,count: 4,)),
                              ),
                            ],
                          ),
                        );
                      }),

                      SizedBox(height: Get.height*0.2,),
                      FullWidthButton(
                        text: "SUBMIT",
                        onTap: (){
                          if(_otpKey.currentState.validate()==true){
                            Navigator.push(context,MaterialPageRoute(builder:(context){return BottomNavScreen();}));
                          }
                        },
                      )

                    ],
                  ),
                ),
              )
            ],
          ),
        )

      ),
    );
  }
}


class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.PrimaryColor,
      padding: AppConstants.screenPadding,
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),
              Spacer(),
              CustomTextWidget("Verification",style: CustomTextStyle.boldMediumTextStyle(color: Colors.white),),
              SizedBox(width: 30,),
              Spacer(),
            ],
          ),
          SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextWidget("Enter 6 digit verification code sent on your given number",style: CustomTextStyle.smallTextStyle1(color: Colors.white),),
          ),
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                CustomTextWidget("2:23 min",style: CustomTextStyle.smallTextStyle1(color: Colors.white),),
                Spacer(),
                CustomTextWidget("Resend  ",style: CustomTextStyle.smallTextStyle1(color: Colors.white),),
              ],
            ),
          ),
          SizedBox(height: 15,),

        ],
      ),
    );
  }
}

