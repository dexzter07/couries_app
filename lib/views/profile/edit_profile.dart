import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/controllers/profile/profile_controller.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_text_field.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EditProfile extends StatefulWidget {

  final String title;
  final List fieldInfo;
  EditProfile({this.title,this.fieldInfo});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _emailController =  TextEditingController();

  final TextEditingController _firstNameController =  TextEditingController();

  final TextEditingController _lastNameController =  TextEditingController();

  final TextEditingController _phoneController =  TextEditingController();

  final TextEditingController _currentPasswordController =  TextEditingController();

  final TextEditingController _newPasswordController1 =  TextEditingController();

  final TextEditingController _newPasswordController2 =  TextEditingController();

  final  _key6 = GlobalKey<FormState>();

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: Form(
        key: _key6,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      widget.title == 'Name' ? SizedBox(height:20,) : SizedBox(height:40,),

                      widget.title == "Name" ?  Stack(
                        children: [
                          Container(
                            height: Get.height*0.25,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: CircleAvatar(
                                radius: Get.width*0.4,
                                backgroundImage: AssetImage("assets/images/user4.jpg"),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom:5,
                              left: Get.width*0.37,
                              child:Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black
                                ),
                                padding: EdgeInsets.all(10),
                                child:  Icon(Icons.camera_alt,color: Colors.white,),
                              )
                          )
                        ],
                      ): Container(),

                      Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.fieldInfo.length,
                              itemBuilder: (context,index){
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(widget.fieldInfo[index],style: CustomTextStyle.smallBoldTextStyle1(),),
                                    SizedBox(height: 10,),
                                    widget.fieldInfo[index] == "Choose Gender" ?

                                    DropdownButtonFormField(
                                      hint:CustomTextWidget(_profileController.gender.value,style: CustomTextStyle.smallTextStyle1(),),
                                      decoration:InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: CustomTextStyle.smallTextStyle1(),
                                          labelStyle: CustomTextStyle.smallTextStyle1(),

                                      ),
                                      onChanged: (value){
                                        _profileController.gender.value  = value;
                                      },
                                      items: [
                                        DropdownMenuItem(child: CustomTextWidget("Male",style: CustomTextStyle.smallTextStyle1(),),value: "Male",),
                                        DropdownMenuItem(child: CustomTextWidget("Female",style: CustomTextStyle.smallTextStyle1(),),value: "Female",),
                                        DropdownMenuItem(child: CustomTextWidget("Others",style: CustomTextStyle.smallTextStyle1(),),value: "Others",),
                                      ],
                                    ):

                                    CustomTextField(
                                      // obSecureText: fieldInfo[0]=="Current Password" ? true : false,
                                      controller: widget.fieldInfo[index] == "Change Email" ? _emailController : widget.fieldInfo[index] == "Change Number" ? _phoneController : widget.fieldInfo[index] == "First Name" ? _firstNameController : widget.fieldInfo[index] == "Current Password" ? _currentPasswordController : widget.fieldInfo[index] == "New Password" ? _newPasswordController1 : widget.fieldInfo[index] == "New Password Again" ? _newPasswordController2 : _lastNameController,
                                      hintText: widget.fieldInfo[index] == "Change Email" ? _profileController.email.value : widget.fieldInfo[index] == "Change Number" ? _profileController.phoneNumber.value : widget.fieldInfo[index] == "First Name" ? _profileController.userFirstName.value : widget.fieldInfo[0]=="Current Password" ? "" : _profileController.userLastName.value,
                                      // borderRadius: BorderRadius.circular(5),
                                      validator: (value){
                                        if(value.length==0){
                                          return "This Field cannot be empty";
                                        }
                                        if(widget.fieldInfo[index]=="New Password Again" && _newPasswordController1.text != _newPasswordController2.text){
                                          return "Password didnot match";
                                        }
                                      },
                                    ),
                                    SizedBox(height: 10,),
                                    widget.fieldInfo[0]=="Change Email" ? CustomTextWidget("We will send verification to your New Email",style: CustomTextStyle.ultraSmallTextStyle(color: Colors.grey),):Container()

                                  ],
                                );
                              }
                          )
                      ),

                      FullWidthButton(
                        text: "Save",
                        // color: AppColors.primaryDarkOrange,
                        // title: "Save",
                        // borderRadius: BorderRadius.circular(8),
                        onTap: (){
                          // if(_key6.currentState.validate()){
                          widget.fieldInfo[0] == "Change Email" ? _profileController.email.value = _emailController.text :  widget.fieldInfo[0] == "Change Number" ? _profileController.phoneNumber.value = _phoneController.text : print("");
                          if(widget.fieldInfo[0]=="First Name"){
                            _profileController.userFirstName.value = _firstNameController.text;
                            _profileController.userLastName.value = _lastNameController.text;
                          }
                          Navigator.pop(context);
                          // }
                        },
                      )

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );



  }
}



