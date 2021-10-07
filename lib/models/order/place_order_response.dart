// To parse this JSON data, do
//
//     final placeOrderResponse = placeOrderResponseFromJson(jsonString);

import 'dart:convert';

PlaceOrderResponse placeOrderResponseFromJson(String str) => PlaceOrderResponse.fromJson(json.decode(str));

String placeOrderResponseToJson(PlaceOrderResponse data) => json.encode(data.toJson());

class PlaceOrderResponse {
  PlaceOrderResponse({
    this.status,
    this.message,
    this.responseData,
  });

  int status;
  String message;
  ResponseData responseData;

  factory PlaceOrderResponse.fromJson(Map<String, dynamic> json) => PlaceOrderResponse(
    status: json["status"],
    message: json["message"],
    responseData: ResponseData.fromJson(json["responseData"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "responseData": responseData.toJson(),
  };
}

class ResponseData {
  ResponseData({
    this.pickupLat,
    this.pickupLong,
    this.dropLat,
    this.dropLong,
    this.pickupDate,
    this.pickupTime,
    this.dropDate,
    this.dropTime,
    this.orderSize,
    this.name,
    this.phoneNumber,
    this.block,
    this.discount,
    this.lateNightChange,
    this.vehicle,
    this.serviceTax,
    this.total,
    this.orderNumber,
    this.userId,
    this.id,
  });

  String pickupLat;
  String pickupLong;
  String dropLat;
  String dropLong;
  DateTime pickupDate;
  String pickupTime;
  DateTime dropDate;
  String dropTime;
  String orderSize;
  String name;
  String phoneNumber;
  String block;
  String discount;
  String lateNightChange;
  String vehicle;
  String serviceTax;
  String total;
  String orderNumber;
  int userId;
  int id;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    pickupLat: json["pickup_lat"],
    pickupLong: json["pickup_long"],
    dropLat: json["drop_lat"],
    dropLong: json["drop_long"],
    pickupDate: DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    dropDate: DateTime.parse(json["drop_date"]),
    dropTime: json["drop_time"],
    orderSize: json["order_size"],
    name: json["name"],
    phoneNumber: json["phone_number"],
    block: json["block"],
    discount: json["discount"],
    lateNightChange: json["late_night_change"],
    vehicle: json["vehicle"],
    serviceTax: json["service_tax"],
    total: json["total"],
    orderNumber: json["order_number"],
    userId: json["user_id"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "pickup_lat": pickupLat,
    "pickup_long": pickupLong,
    "drop_lat": dropLat,
    "drop_long": dropLong,
    "pickup_date": "${pickupDate.year.toString().padLeft(4, '0')}-${pickupDate.month.toString().padLeft(2, '0')}-${pickupDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "drop_date": "${dropDate.year.toString().padLeft(4, '0')}-${dropDate.month.toString().padLeft(2, '0')}-${dropDate.day.toString().padLeft(2, '0')}",
    "drop_time": dropTime,
    "order_size": orderSize,
    "name": name,
    "phone_number": phoneNumber,
    "block": block,
    "discount": discount,
    "late_night_change": lateNightChange,
    "vehicle": vehicle,
    "service_tax": serviceTax,
    "total": total,
    "order_number": orderNumber,
    "user_id": userId,
    "id": id,
  };
}
