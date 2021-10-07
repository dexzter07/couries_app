import 'package:couries_one/views/home/home_screen.dart';
import 'package:couries_one/views/home/parcel/order_payment_view.dart';
import 'package:couries_one/views/home/parcel/place_order_view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'configs/styles/app_colors.dart';
import 'package:couries_one/views/authentication/login.dart';
import 'package:couries_one/views/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColors.PrimaryColor));
  runApp(
      GetMaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    )
  );
}