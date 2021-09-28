import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/models/notification/notification_model.dart';
import 'package:flutter/material.dart';


class NotificationWidget extends StatelessWidget {

  final NotificationModel notificationModel;
  NotificationWidget({this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          notificationModel.icon,
          SizedBox(width: 15,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notificationModel.title,style: CustomTextStyle.boldMediumTextStyle(),),
                SizedBox(height: 5,),
                Text(notificationModel.text,style: CustomTextStyle.smallTextStyle1(color: Colors.grey),),
                SizedBox(height: 5,),
                Text(notificationModel.dateTime,style: CustomTextStyle.ultraSmallTextStyle(),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
