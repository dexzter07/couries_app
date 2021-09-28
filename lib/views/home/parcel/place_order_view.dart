import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/views/home/parcel/add_date_and_time.dart';
import 'package:couries_one/views/home/parcel/add_location.dart';
import 'package:couries_one/views/home/parcel/destination_location.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_inkwell.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlaceOrderScreen extends StatefulWidget {
  String address;
  String address1;
  PlaceOrderScreen({this.address, this.address1});
  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final GlobalKey<ScaffoldState> _globalKey2 = GlobalKey<ScaffoldState>();
  bool title = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(),
      key: _globalKey2,
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CustomAppBar(title: "Place Order"),
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

                      LabelContainer(),
                      SizedBox(height: 30,),

                      CustomTextWidget("Add Location",style: CustomTextStyle.smallTextStyle1(color: Colors.grey)),
                      SizedBox(height: 10,),

                      LocationStack(address:widget.address,address1:widget.address1),
                      SizedBox(height: 20,),

                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(color: Colors.grey.withOpacity(0.2),offset: Offset(1,3), blurRadius: 5,spreadRadius: 3),
                            ]
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: CustomTextWidget("Estimated Fare",style: CustomTextStyle.smallBoldTextStyle1(),)),
                                CustomTextWidget("+ 20",style: CustomTextStyle.smallTextStyle1(color: Colors.grey),)
                              ],
                            ),
                            SizedBox(height: 5,),

                            Row(
                              children: [
                                Expanded(child: CustomTextWidget("Moving Cart",style: CustomTextStyle.smallTextStyle1(color: Colors.grey),)),
                                CustomTextWidget("\$ 138.00",style: CustomTextStyle.boldMediumTextStyle(fontFamily: "PoppinsBold",color: AppColors.PrimaryColor),)
                              ],
                            ),

                            SizedBox(height: 20,),
                            FullWidthButtonWithIcon(
                              title: "Next",
                              icon: Icon(Icons.navigate_next,color: Colors.white,),
                              color: AppColors.PrimaryColor,
                              padding: EdgeInsets.symmetric(vertical:15,horizontal: 15),
                              // borderRadius: BorderRadius.circular(60),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDateTimeScreen(pickup:widget.address,dest:widget.address1)));
                              },
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
}






class LabelContainer extends StatefulWidget {
  @override
  _LabelContainerState createState() => _LabelContainerState();
}

class _LabelContainerState extends State<LabelContainer> {

  int _selectedIndex=1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(

        children: [
            Expanded(
              child: CustomInkWell(
                onTap: (){
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Column(
                  children: [
                    SizedBox(height: 25,),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _selectedIndex == 1 ? Colors.white : Color(0xFF005A8D)
                      ),
                      padding: EdgeInsets.all(20),
                      child: SvgPicture.asset("assets/svgs/scooter.svg",color: _selectedIndex == 1 ? AppColors.PrimaryColor : Colors.white, height: 50,),
                    ),
                    SizedBox(height: 10,),
                    _selectedIndex == 1 ? Image.asset("assets/images/indicator.png",height: 15,) : SizedBox(height: 15,),
                  ],
                ),
              ),
            ),

          Expanded(
            child: CustomInkWell(
              onTap: (){
                setState(() {
                  _selectedIndex = 2;
                });
              },
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _selectedIndex == 2 ? Colors.white : Color(0xFF005A8D)
                    ),
                    padding: EdgeInsets.all(20),
                    child: SvgPicture.asset("assets/svgs/van.svg",color: _selectedIndex == 2 ? AppColors.PrimaryColor : Colors.white,height: 50,),
                  ),
                  SizedBox(height: 10,),
                  _selectedIndex == 2 ? Image.asset("assets/images/indicator.png",height: 15,) : SizedBox(height: 15,),
                ],
              ),
            ),
          ),

          Expanded(
            child: CustomInkWell(
              onTap: (){
                setState(() {
                  _selectedIndex = 3;
                });
              },
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _selectedIndex == 3 ? Colors.white : Color(0xFF005A8D)
                    ),
                    padding: EdgeInsets.all(20),
                    child: SvgPicture.asset("assets/svgs/truck.svg",color: _selectedIndex == 3 ? AppColors.PrimaryColor : Colors.white,height: 50,),
                  ),
                  SizedBox(height: 10,),
                  _selectedIndex == 3 ? Image.asset("assets/images/indicator.png",height: 15,) : SizedBox(height: 15,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LocationStack extends StatefulWidget {
  String address;
  String address1;
  LocationStack({this.address, this.address1});
  @override
  _LocationStackState createState() => _LocationStackState();
}

class _LocationStackState extends State<LocationStack> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Column(
          children: [
            CustomAddlocationWidget(location: widget.address, address1:widget.address1),
            CustomAddlocationWidget1(location: widget.address1,address:widget.address),
          ],
        ),
        Positioned(
            left: 5,
            top: 55,
            child: Image.asset("assets/images/arrow3.png",height: 100,width: 50,fit: BoxFit.fill,))
      ],
    );
  }
}





class CustomAddlocationWidget extends StatelessWidget {

  final String location;
  String address;
  String address1;

  CustomAddlocationWidget({this.location,this.address,this.address1});

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical:15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2),offset: Offset(1,3), blurRadius: 5,spreadRadius: 3),
          ]
      ),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 25),
      child: Row(
        children: [
          Icon(Icons.circle,color: Colors.red,size: 20,),
          SizedBox(width: 10,),
          Expanded(child:CustomTextWidget(location!=null?location:"Add Location",style: CustomTextStyle.smallTextStyle1(),)

          ),
          CustomInkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddLocationScreen(destination:address1)));
              },
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.PrimaryColor),
              padding: EdgeInsets.all(3),
              child: Icon(Icons.add,color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
}

class CustomAddlocationWidget1 extends StatelessWidget {
  final String location;
  String address1;
  String address;

  CustomAddlocationWidget1({this.location,this.address1,this.address});
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical:15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2),offset: Offset(1,3), blurRadius: 5,spreadRadius: 3),
          ]
      ),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 25),
      child: Row(
        children: [
          Icon(Icons.circle,color: Colors.red,size: 20,),
          SizedBox(width: 10,),
          Expanded(child:CustomTextWidget(location!=null?location:"Add Location",style: CustomTextStyle.smallTextStyle1(),)),
          CustomInkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DestinationLocation(pickup:address)));
            },
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.PrimaryColor),
              padding: EdgeInsets.all(3),
              child: Icon(Icons.add,color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
}

