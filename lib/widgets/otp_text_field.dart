import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/controllers/authentication/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpTextField extends StatelessWidget {

  final int count;
  final Function validator;
  final bool obSecureText;
  final BorderRadius borderRadius;
  final String hintText;
  final int maxLines;
  final int maxWords;
  final TextEditingController controller;
  final EdgeInsets contentPadding;
  final OtpController _otpController = Get.put(OtpController());

  OtpTextField({this.count,this.contentPadding,this.controller,this.validator,this.obSecureText,this.borderRadius,this.hintText,this.maxLines,this.maxWords});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: maxWords == null ? 1 : maxWords,
        maxLines: maxLines==null? 1 : maxLines,
        obscureText: obSecureText==null? false : obSecureText,
        validator:  (value){
          if (value==""){
            return "";
          }
          else return null;
        },
        textAlign: TextAlign.center,
        style: CustomTextStyle.boldMediumTextStyle(color:Colors.white),
        onChanged: (value){

          if(value!="" && count!=4){
            FocusScope.of(context).nextFocus();
          }
          else if(value!="" && count==4){
            FocusScope.of(context).unfocus();
          }
          else if(value=="" && count==1){
            FocusScope.of(context).unfocus();
          }
          else{
            FocusScope.of(context).previousFocus();
          }
        },

        decoration: InputDecoration(
             fillColor: Colors.grey.withOpacity(0.4),
            filled: true,
            counterText: "1",
            counterStyle: TextStyle(color: Colors.transparent),
            hintText:  hintText == null ? "" : hintText,
            hintStyle: CustomTextStyle.smallTextStyle1(color: Colors.grey),
            errorMaxLines: 1,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                borderRadius: borderRadius == null ?  BorderRadius.circular(5) : borderRadius
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                borderRadius: borderRadius == null ?  BorderRadius.circular(5) : borderRadius
            ),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: borderRadius == null ?  BorderRadius.circular(5) : borderRadius
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: borderRadius == null ?  BorderRadius.circular(5) : borderRadius
            )
          // border: InputBorder.none
        ),
      ),
    );
  }
}
