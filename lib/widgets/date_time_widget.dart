
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/custom_text_style.dart';
import 'package:couries_one/widgets/custom_inkwell.dart';
import 'package:couries_one/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';


class DateTimeSingleWidget extends StatefulWidget {

  final String date;
  final String day;
  final bool selected;
  DateTimeSingleWidget({this.date,this.day,this.selected});

  @override
  _DateTimeSingleWidgetState createState() => _DateTimeSingleWidgetState();
}

class _DateTimeSingleWidgetState extends State<DateTimeSingleWidget> {

  bool _isClicked ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isClicked =  widget.selected ?? false;

  }

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: (){
        setState(() {
          _isClicked = !_isClicked;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _isClicked == true ? AppColors.primaryDarkBlue :   Colors.white
        ),
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        margin:  EdgeInsets.only(right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextWidget(widget.date,style: CustomTextStyle.smallBoldTextStyle1(color: _isClicked == true ? Colors.white : Colors.black),),
            CustomTextWidget(widget.day,style: CustomTextStyle.smallTextStyle1(color: _isClicked == true ? Colors.white : Colors.black),)
          ],
        ),
      ),
    );
  }
}
