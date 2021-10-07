import 'package:couries_one/models/order/place_order_response.dart';
import 'package:couries_one/views/home/parcel/order_details.dart';
import 'package:couries_one/views/home/parcel/order_payment_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RecipientController extends GetxController {
  var name = TextEditingController();
  var email = TextEditingController();
  var location = TextEditingController();
  var pickupLat = ''.obs;
  var pickupLong = ''.obs;
  var dropLat = ''.obs;
  var dropLong = ''.obs;
  var estimatedFare = "200";
  var pickupDate = ''.obs;
  var pickupTime = "11:02";
  var dropDate = ''.obs;
  var dropTime = "02:05";
  var orderSize = ''.obs;
  var discount = "20";
  var lateNightChange = "50";
  var vehicle = "car";
  var serviceTax = "20";
  var total = "120";
  var isLoading = false.obs;

  placeOrder() async {
    isLoading.value = true;
    final String apiUrl = "https://www.store.buddybuzz.in/api/placeOrder";
    final response = await http.post(apiUrl, headers: {
      // "Accept": "application/json",
      "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWU2NGMxOWE0MWYwN2Y0ZDgyNTVlMmYzZDdmMjcxN2JjZmY3ZWQ3MTVkZGRkNzg2NGU0ZmNmM2Q1MjBiYmFlMzEwNmYzZTQxNTY5NjEwNDciLCJpYXQiOjE2MzMxNjMwOTYsIm5iZiI6MTYzMzE2MzA5NiwiZXhwIjoxNjY0Njk5MDk2LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.mMBLQI3-CI-q-nz5I0sluWg0BOSUhyaYpFoQuLHcG7HUFJnQ1hUAyYk5oxEUHfgvXPW7AOtMshXKcSPO1m2aPWFk06xA7L9ZmTvalrcgEosgbbKrRaV9IhtD61q6oDVQrfTzoa673yZpV7vh8OFS61wkoQhD3N6X4vtraznDQ64EkNUSChvp67uy8X8qt0AIHciIcr8vsHqZ0lRaYYPxlKLNfKsM1jd_lPuHMWOTRVOVIOKQrHKdScs_YxYcEXlkTCeMM29i8nix97johVRwTDtsPegjFc1VFeP-Q1ZVu31TgAV4xtOQZI94Kqvj4CbQVoqSebfvo0Cx8m_fV9rJmAic9TMc0eqPC4vuL-CDJMV3rg_R57ag6XZVbR79Xxkw2UbX71WPhZLaqah-tE3H0JMzM7oruybal5QNRsFByPfy2IGMW8U4IewI0-IxgRwgxGfKOMrMsJ1BJ_FEv44X-8Rtcm67IPopLH2NJ0APFWg0PyKhKDko8z0-zNLJfYyHr97iuYWLMkyrHEDkAM0UxL2yUPQelsrAX7MYtaR2KaFXZv3czh49DUgS7jrwOffe79NEySdk2S0sbqSIMDqrsoe47RbJwEtpiKIJXqB0lMarXjWJZ9k0wweubpoZCfhqkxX0dzpCb8SmHgpWP-yv6yrvxux9SutFa5p8x0hggL8"
    }, body: {
      'pickup_lat': pickupLat.value,
      'pickup_long': pickupLong.value,
      'drop_lat': dropLat.value,
      'drop_long': dropLong.value,
      'estimate_fare': "20",
      'pickup_date': pickupDate.value,
      'pickup_time': "02:05",
      'drop_date': dropDate.value,
      'drop_time': "02:05",
      'order_size': orderSize.value,
      'name': name.text,
      'phone_number': email.text,
      'block': location.text,
      'discount': "12",
      'late_night_change': "20",
      'vehicle': "vehicle",
      'service_tax': "20",
      'total': "20",
    });

    isLoading.value = false;
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = placeOrderResponseFromJson(response.body);
      String orderId = jsonResponse.responseData.orderNumber;

      Get.to(OrderPaymentScreen(orderId:orderId));

    } else {
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
