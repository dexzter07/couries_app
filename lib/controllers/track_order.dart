import 'package:couries_one/models/order/order_id_response.dart';
import 'package:couries_one/views/home/parcel/tracking_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class TrackOrderController extends GetxController{
  var orderId = TextEditingController();
  var isLoading = false.obs;

  getOrderId() async {
    isLoading.value = true;
    final String apiUrl = "https://store.buddybuzz.in/api/trackOrder";
    final response = await http.post(apiUrl, headers:{
      "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWU2NGMxOWE0MWYwN2Y0ZDgyNTVlMmYzZDdmMjcxN2JjZmY3ZWQ3MTVkZGRkNzg2NGU0ZmNmM2Q1MjBiYmFlMzEwNmYzZTQxNTY5NjEwNDciLCJpYXQiOjE2MzMxNjMwOTYsIm5iZiI6MTYzMzE2MzA5NiwiZXhwIjoxNjY0Njk5MDk2LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.mMBLQI3-CI-q-nz5I0sluWg0BOSUhyaYpFoQuLHcG7HUFJnQ1hUAyYk5oxEUHfgvXPW7AOtMshXKcSPO1m2aPWFk06xA7L9ZmTvalrcgEosgbbKrRaV9IhtD61q6oDVQrfTzoa673yZpV7vh8OFS61wkoQhD3N6X4vtraznDQ64EkNUSChvp67uy8X8qt0AIHciIcr8vsHqZ0lRaYYPxlKLNfKsM1jd_lPuHMWOTRVOVIOKQrHKdScs_YxYcEXlkTCeMM29i8nix97johVRwTDtsPegjFc1VFeP-Q1ZVu31TgAV4xtOQZI94Kqvj4CbQVoqSebfvo0Cx8m_fV9rJmAic9TMc0eqPC4vuL-CDJMV3rg_R57ag6XZVbR79Xxkw2UbX71WPhZLaqah-tE3H0JMzM7oruybal5QNRsFByPfy2IGMW8U4IewI0-IxgRwgxGfKOMrMsJ1BJ_FEv44X-8Rtcm67IPopLH2NJ0APFWg0PyKhKDko8z0-zNLJfYyHr97iuYWLMkyrHEDkAM0UxL2yUPQelsrAX7MYtaR2KaFXZv3czh49DUgS7jrwOffe79NEySdk2S0sbqSIMDqrsoe47RbJwEtpiKIJXqB0lMarXjWJZ9k0wweubpoZCfhqkxX0dzpCb8SmHgpWP-yv6yrvxux9SutFa5p8x0hggL8"
    },
    body: {
      'order_id':orderId.text,
    }
    );
    isLoading.value = false;
    print(response.body);
    if(response.statusCode == 200){
      var jsonResponse = orderIdResponseFromJson(response.body);
      String orderNumber = jsonResponse.responseData.orderNumber;
      String pickupLat = jsonResponse.responseData.pickupLat;
      String pickupLong = jsonResponse.responseData.pickupLong;
      String dropLat = jsonResponse.responseData.dropLat;
      String dropLong = jsonResponse.responseData.dropLong;

      print(orderNumber);
      Get.to(TrackingView(pickupLat:pickupLat,pickupLong:pickupLong,dropLat:dropLat,dropLong:dropLong));
    }
    else {
      Get.snackbar(
          "Error",
          "Order did not placed!",
          icon: Icon(
            Icons.dangerous,
            color: Colors.red,
          ),
          snackPosition: SnackPosition.BOTTOM);
      print("no response");
    }
  }
}
