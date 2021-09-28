import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/views/authentication/login.dart';
import 'package:couries_one/widgets/custom_inkwell.dart';
import 'package:couries_one/widgets/custom_text_field.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
  bool _agreed = false;

  @override
  void dispose() {
    super.dispose();
    _numberController.dispose();
    _numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  AppColors.backgroundColor,
        centerTitle: true,
        title: CustomTextWidget("Sign Up",style: CustomTextStyle.boldMediumTextStyle(),),
        elevation: 0,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: AppConstants.screenPadding,
        child: Form(
          key: _signUpKey,
          child: ListView(
            children: [

              Align(
                  alignment: FractionalOffset.centerLeft,
                  child: CustomTextWidget("  Full Name",style: CustomTextStyle.mediumTextStyle(),)),
              CustomTextField(
                hintText: "Enter your full name",
                controller: _nameController,
                validator: (String value){
                  if(value.length<5){
                    return "Please provide a valid Name";
                  }
                  else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),

              Align(
                  alignment: FractionalOffset.centerLeft,
                  child: CustomTextWidget("  Email",style: CustomTextStyle.mediumTextStyle(),)),
              CustomTextField(
                hintText: "Enter your Email",
                controller: _emailController,
                validator: (String value){
                  if(value.length<5){
                    return "Please provide a valid Email";
                  }
                  else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),

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
                hintText: "Enter your Country",
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
              SizedBox(height: 20),

              Row(
                children: [
                  CustomInkWell(
                    onTap: (){
                      setState(() {
                        _agreed = !_agreed;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: _agreed==true? AppColors.PrimaryColor : Colors.white,
                          border: Border.all(color: _agreed==true? Colors.transparent : Colors.grey,),
                          shape: BoxShape.circle),
                      child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: _agreed
                              ? Icon(Icons.check, size: 12.0, color: Colors.white,)
                              : Icon(Icons.check, size: 12.0, color: Colors.white,)
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("I agree to the terms and condition",style: CustomTextStyle.smallTextStyle1()),
                ],
              ),
              SizedBox(height: 30),

              FullWidthButton(
                onTap: (){
                 if( _signUpKey.currentState.validate()==true){
                   Navigator.push(context,MaterialPageRoute(builder:(context){return LoginScreen();}));
                 }
                },
                text: "CONTINUE",
              ),
              SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget("Already have an account?",style: CustomTextStyle.smallTextStyle1(),),
                  CustomInkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder:(context){return LoginScreen();}));
                    },
                    child: CustomTextWidget(" Sign In",style: CustomTextStyle.smallBoldTextStyle1(),),
                  )
                ],
              ),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
