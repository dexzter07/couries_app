import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/views/authentication/otp_verification.dart';
import 'package:couries_one/views/authentication/sign_up.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_inkwell.dart';
import 'package:couries_one/widgets/custom_text_field.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _countryController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _numberController.dispose();
    _numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Form(
          key: _loginKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomAppBar(title: "CouriesOne",),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color:AppColors.backgroundColor,
                    borderRadius: ContainerDecor.BorderRadius1
                  ),
                  child: Padding(
                    padding:  AppConstants.screenPadding,
                    child: ListView(
                      shrinkWrap: true,
                      children: [

                        Align(
                            alignment: FractionalOffset.centerLeft,
                            child: CustomTextWidget("  Country",style: CustomTextStyle.mediumTextStyle(),)),
                        CustomTextField(
                          hintText: "Enter your Country",
                          controller: _countryController,
                          validator: (String value){
                            if(value.length<5){
                              return "Please provide a valid Country";
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20),

                        Align(
                            alignment: FractionalOffset.centerLeft,
                            child: CustomTextWidget("  Phone Number",style: CustomTextStyle.mediumTextStyle(),)),
                        CustomTextField(
                          hintText: "Enter your Number",
                          controller: _numberController,
                          validator: (String value){
                            if(value.length<5){
                              return "Please provide a valid Number";
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 30),

                        FullWidthButton(
                          text: "CONTINUE",
                          onTap: (){
                            if(_loginKey.currentState.validate()==true){
                              Navigator.push(context,MaterialPageRoute(builder:(context){return OtpVerificationScreen();}));
                            }
                          },
                        ),
                        SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWidget("Don't have an account?",style: CustomTextStyle.smallTextStyle1(),),
                            CustomInkWell(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder:(context){return SignUpScreen();}));
                              },
                              child: CustomTextWidget(" Sign Up",style: CustomTextStyle.smallBoldTextStyle1(),),
                            )
                          ],
                        ),
                        SizedBox(height: 20),

                        Center(child: CustomTextWidget("Or Continue with",style: CustomTextStyle.smallTextStyle1(),),),
                        SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconContainer(imageUrl: "assets/images/facebook1.png",),
                            SizedBox(width: 20,),
                            CustomIconContainer(imageUrl: "assets/images/google.png",)
                          ],
                        )


                      ],
                    ),
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




class CustomIconContainer extends StatelessWidget {

  final String imageUrl;
  CustomIconContainer({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder:(context){return OtpVerificationScreen();}));
      },
      child: Container(
          decoration: BoxDecoration(
            color:  Color(0xFF2742A5).withOpacity(0.8),
            borderRadius: BorderRadius.circular(12)
          ),
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 15),
          child: Image.asset(imageUrl,height: 40,width: 40,),
      ),
    );
  }
}
