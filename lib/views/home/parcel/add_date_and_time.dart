import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/controllers/recipient.dart';
import 'package:couries_one/views/home/parcel/order_size.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:couries_one/widgets/date_time_widget.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDateTimeScreen extends StatefulWidget {
  String pickup;
  String dest;
  AddDateTimeScreen({this.pickup,this.dest});
  @override
  _AddDateTimeScreenState createState() => _AddDateTimeScreenState();
}

class _AddDateTimeScreenState extends State<AddDateTimeScreen> {
  RecipientController _recipientController = Get.put(RecipientController());

  DateTime _selectedValue;
  DateTime _selectedValue1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CustomAppBar(title: "Set Date & Time",),

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
                    CustomTextWidget("Pickup Date and Time",style: CustomTextStyle.smallBoldTextStyle1(),),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        CustomTextWidget(_selectedValue1!=null?"${_selectedValue1.day}/${_selectedValue1.month}/${_selectedValue1.year}":"Select Date",style: CustomTextStyle.smallTextStyle1(color: Colors.grey),),
                        Spacer(),
                        Icon(Icons.calendar_today,size: 20,color: Colors.grey,)
                      ],
                    ),
                    SizedBox(height: 20,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DatePicker(
                          DateTime.now(),
                          initialSelectedDate: DateTime.now(),
                          selectionColor: Colors.blue,
                          selectedTextColor: Colors.white,
                          onDateChange: (date) {
                            // New date selected
                            setState(() {
                              _selectedValue1 = date;
                              _recipientController.pickupDate.value = _selectedValue1.toString();
                              print(_selectedValue1);
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),

                    Row(
                      children: [
                        CustomTextWidget("Pickup Time",style: CustomTextStyle.smallTextStyle1(color: Colors.grey),),
                        SizedBox(width: 25,),
                        Container(
                            width: 120,
                            child: CustomDropDown())
                      ],
                    ),
                    SizedBox(height:Get.height*0.07,),

                    CustomTextWidget("Drop off Date and Time",style: CustomTextStyle.smallBoldTextStyle1(),),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        CustomTextWidget(_selectedValue!=null?"${_selectedValue.day}/${_selectedValue.month}/${_selectedValue.year}":"Select Date",style: CustomTextStyle.smallTextStyle1(color: Colors.grey),),
                        Spacer(),
                        Icon(Icons.calendar_today,size: 20,color: Colors.grey,)
                      ],
                    ),
                    SizedBox(height: 20,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DatePicker(
                          DateTime.now(),
                          initialSelectedDate: DateTime.now(),
                          selectionColor: Colors.blue,
                          selectedTextColor: Colors.white,
                          onDateChange: (date) {

                            // New date selected
                            setState(() {
                              _selectedValue = date;
                              _recipientController.dropDate.value = _selectedValue.toString();
                              print(_selectedValue);
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),

                    Row(
                      children: [
                        CustomTextWidget("Pickup Time",style: CustomTextStyle.smallTextStyle1(color: Colors.grey),),
                        SizedBox(width: 25,),
                        Container(
                            width: 120,
                            child: CustomDropDown())
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FullWidthButtonWithIcon(
                title: "Next",
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSizeScreen(pickup:widget.pickup,dest:widget.dest,selectedDate:_selectedValue,selectedDate1:_selectedValue1)));
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}






class CustomDropDown extends StatefulWidget {
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {

  String _selectedItem = "10:30 Am";

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: InputBorder.none
      ),
        items: [
          DropdownMenuItem(child: CustomTextWidget("10:30 Am",style: CustomTextStyle.smallTextStyle1(),),value: "10:30 Am",),
          DropdownMenuItem(child: CustomTextWidget("11:30 Am",style: CustomTextStyle.smallTextStyle1(),),value: "11:30 Am",),
          DropdownMenuItem(child: CustomTextWidget("12:30 Am",style: CustomTextStyle.smallTextStyle1(),),value: "12:30 Am",),
          DropdownMenuItem(child: CustomTextWidget("01:30 Pm",style: CustomTextStyle.smallTextStyle1(),),value: "01:30 Pm",)
        ],
        onChanged: (value){
          setState(() {
            _selectedItem = value;
          });
        },
        value: _selectedItem,
    );
  }
}

