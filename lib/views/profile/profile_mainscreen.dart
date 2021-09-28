
import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/controllers/profile/profile_controller.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_inkwell.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_profile.dart';


class ProfileScreen extends StatelessWidget {

  final ProfileController _profileController = Get.put(ProfileController());

  Widget userInfo(BuildContext context){
    return
      Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(
                "assets/images/user3.jpg"
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(_profileController.userFirstName.value+ " " +_profileController.userLastName.value,style: CustomTextStyle.smallBoldTextStyle1(),),
                SizedBox(height: 5,),
                CustomTextWidget(_profileController.email.value,style: CustomTextStyle.ultraSmallTextStyle(),),

              ],
            ),
          ),
          SizedBox(width: 20,),
          CustomInkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){return EditProfile(title: "Name",fieldInfo: ["First Name","Last Name"],);}));
                },
              child: CustomTextWidget("Edit",style: CustomTextStyle.ultraSmallBoldTextStyle(),))
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Obx((){
          return Column(
            children: [
              CustomAppBar(title: "Profile",),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color:AppColors.backgroundColor,
                      borderRadius: ContainerDecor.BorderRadius1
                  ),
                  padding:  AppConstants.screenPadding,
                  child: Column(
                    children: [
                      userInfo(context),
                      SizedBox(height:30,),

                      CustomImageTextRowWidget(title: "Gender",title1:_profileController.gender.value,imageUrl: "assets/images/gender.png",fieldInfo: ["Choose Gender"],),
                      CustomImageTextRowWidget(title: "Email",title1:_profileController.email.value,imageUrl: "assets/images/email.png",fieldInfo: ["Change Email"],),
                      CustomImageTextRowWidget(title: "Phone Number",title1:_profileController.phoneNumber.value,imageUrl: "assets/images/phone.png",fieldInfo: ["Change Number"],),
                      CustomImageTextRowWidget(title: "Change Password",title1:_profileController.gender.value,imageUrl: "assets/images/password.png",fieldInfo: ["Current Password","New Password","New Password Again"],)

                    ],
                  ),
                ),
              )


            ],
          );
        }),
      ),
    );
  }
}



class CustomImageTextRowWidget extends StatefulWidget {

  final String title;
  final String title1;
  final String imageUrl;
  final List fieldInfo;
  CustomImageTextRowWidget({this.title, this.imageUrl,this.title1,this.fieldInfo});

  @override
  _CustomImageTextRowWidgetState createState() => _CustomImageTextRowWidgetState();
}

class _CustomImageTextRowWidgetState extends State<CustomImageTextRowWidget> {

  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: ()async{
        setState(() {
          _isTapped = !_isTapped;
        });
        await Future.delayed(Duration(milliseconds: 200),(){
          Navigator.push(context, MaterialPageRoute(builder: (context){return EditProfile(title: widget.title,fieldInfo: widget.fieldInfo,);}));
          setState(() {
            _isTapped = !_isTapped;
          });

        });
      },
      child: Container(
        color: _isTapped == true ? Color(0xFFEBF0FF): Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 15),
        child: Row(
          children: [
            Image.asset(widget.imageUrl,fit: BoxFit.cover,width: 15,),
            SizedBox(width: 15,),
            CustomTextWidget(widget.title,style: CustomTextStyle.smallTextStyle1(),),
            Spacer(),
            CustomTextWidget(widget.title1,style: CustomTextStyle.ultraSmallTextStyle(color: Colors.grey),),


          ],
        ),
      ),
    );
  }
}
