
import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/controllers/recipient.dart';
import 'package:couries_one/models/home/order_details_model.dart';
import 'package:couries_one/views/home/parcel/recipient.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_inkwell.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSizeScreen extends StatelessWidget {
  String pickup;
  String dest;
  DateTime selectedDate;
  DateTime selectedDate1;

  OrderSizeScreen({this.pickup,this.dest,this.selectedDate,this.selectedDate1});

  final List <ParcelAndCourierModel> _orderSizeDetails = [
    ParcelAndCourierModel(imageUrl: "assets/images/order1.png",title1: "Small",title2: "Max. 25 kg, 8 x 38 x 64 cm",title3: "Fits in an envelope"),
    ParcelAndCourierModel(imageUrl: "assets/images/parcel1.jpg",title1: "Medium",title2: "Max. 25 kg, 19 x 38 x 64 cm",title3: "Fits in an shoe box"),
    ParcelAndCourierModel(imageUrl: "assets/images/parcel2.jpg",title1: "Large",title2: "Max. 25 kg, 41 x 38 x 64 cm",title3: "Fits in an cardboard box"),
    ParcelAndCourierModel(imageUrl: "assets/images/parcel5.png",title1: "Custom",title2: "Max: 30kg or 300cm",title3: "Fits in an skid"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Column(
          children: [

            CustomAppBar(title: "Order Size",),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color:AppColors.backgroundColor,
                    borderRadius: ContainerDecor.BorderRadius1
                ),
                padding:  AppConstants.screenPadding,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _orderSizeDetails.length,
                  itemBuilder: (context,index){
                    return OrderSizeWidget(parcelAndCourierModel: _orderSizeDetails[index],);
                  },
                ),
              ),
            ),

            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left:20,right: 20,top: 0,bottom: 0),
              child: FullWidthButtonWithIcon(
                title: "Next",
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>RecipientScreen(
                    pickup:pickup,dest:dest,selectedDate:selectedDate,selectedDate1:selectedDate1,size:"small",)

                  ));
                  },
              ),
            )
          ],
        ),
      ),
    );
  }
}




class OrderSizeWidget extends StatefulWidget {

  final ParcelAndCourierModel parcelAndCourierModel;
  OrderSizeWidget({this.parcelAndCourierModel});

  @override
  _OrderSizeWidgetState createState() => _OrderSizeWidgetState();
}

class _OrderSizeWidgetState extends State<OrderSizeWidget> {
  RecipientController _recipientController = Get.put(RecipientController());
  bool _isSelected = false ;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: (){
        _recipientController.orderSize.value = widget.parcelAndCourierModel.title1;
        setState(() {
           _isSelected = ! _isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _isSelected == true ? Colors.blue : Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.2),offset: Offset(3,3), blurRadius: 5,spreadRadius: 3),
            ]
        ),
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 12),
        margin: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
        child: Row(
          children: [
            Image.asset(widget.parcelAndCourierModel.imageUrl,width: Get.width*0.3,height: Get.height*0.15,fit: BoxFit.fill,),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(widget.parcelAndCourierModel.title1,style: CustomTextStyle.smallBoldTextStyle1(),),
                  SizedBox(height: 5,),
                  CustomTextWidget(widget.parcelAndCourierModel.title2,style: CustomTextStyle.smallTextStyle1(),),
                  SizedBox(height: 5,),
                  CustomTextWidget(widget.parcelAndCourierModel.title3,style: CustomTextStyle.smallTextStyle1(color: Colors.grey),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
