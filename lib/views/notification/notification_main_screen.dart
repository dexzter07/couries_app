import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/models/notification/notification_model.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/notification_widget.dart';
import 'package:flutter/material.dart';



class NotificationScreen extends StatelessWidget {

  final List<NotificationModel>_notificationList = [
    NotificationModel(icon: Icon(Icons.notifications_active_outlined),title: "Your food has received 4 star by a customer",dateTime: "April 30, 2014 1:01 PM",text: "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo"),
    NotificationModel(icon: Icon(Icons.attach_money_rounded),title: "Your payment has been cleared",dateTime: "April 30, 2014 1:01 PM",text: "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo"),
    NotificationModel(icon: Icon(Icons.margin),title: "Please check your account for more info",dateTime: "April 30, 2014 1:01 PM",text: "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo"),
    NotificationModel(icon: Icon(Icons.attach_money_rounded),title: "Your payment has been cleared",dateTime: "April 30, 2014 1:01 PM",text: "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo"),
    NotificationModel(icon: Icon(Icons.notifications_active_outlined),title: "Your food has received 4 star by a customer",dateTime: "April 30, 2014 1:01 PM",text: "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo"),
    NotificationModel(icon: Icon(Icons.attach_money_rounded),title: "Your payment has been cleared",dateTime: "April 30, 2014 1:01 PM",text: "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo"),
    NotificationModel(icon: Icon(Icons.margin),title: "Please check your account for more info",dateTime: "April 30, 2014 1:01 PM",text: "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo"),
    NotificationModel(icon: Icon(Icons.attach_money_rounded),title: "Your payment has been cleared",dateTime: "April 30, 2014 1:01 PM",text: "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "Notifications",),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color:AppColors.backgroundColor,
                    borderRadius: ContainerDecor.BorderRadius1
                ),
                padding:  AppConstants.screenPadding,
                child: ListView.builder(
                  itemCount: _notificationList.length,
                  itemBuilder: (context,index){
                    return NotificationWidget(notificationModel: _notificationList[index],);
                  },
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
