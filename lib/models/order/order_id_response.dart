// To parse this JSON data, do
//
//     final orderIdResponse = orderIdResponseFromJson(jsonString);

import 'dart:convert';

OrderIdResponse orderIdResponseFromJson(String str) => OrderIdResponse.fromJson(json.decode(str));

String orderIdResponseToJson(OrderIdResponse data) => json.encode(data.toJson());

class OrderIdResponse {
  OrderIdResponse({
    this.status,
    this.message,
    this.responseData,
  });

  int status;
  String message;
  ResponseData responseData;

  factory OrderIdResponse.fromJson(Map<String, dynamic> json) => OrderIdResponse(
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
    this.id,
    this.orderNumber,
    this.userId,
    this.serviceTax,
    this.total,
    this.bookingDate,
    this.bookingDateId,
    this.vehicle,
    this.pickupLat,
    this.pickupLong,
    this.dropLat,
    this.dropLong,
    this.estimatedFare,
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
    this.paymentType,
    this.paymentStatus,
    this.transactionId,
    this.orderStatus,
    this.createdAt,
  });

  int id;
  String orderNumber;
  int userId;
  String serviceTax;
  String total;
  dynamic bookingDate;
  dynamic bookingDateId;
  String vehicle;
  String pickupLat;
  String pickupLong;
  String dropLat;
  String dropLong;
  dynamic estimatedFare;
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
  String paymentType;
  String paymentStatus;
  dynamic transactionId;
  String orderStatus;
  DateTime createdAt;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    id: json["id"],
    orderNumber: json["order_number"],
    userId: json["user_id"],
    serviceTax: json["service_tax"],
    total: json["total"],
    bookingDate: json["booking_date"],
    bookingDateId: json["booking_date_id"],
    vehicle: json["vehicle"],
    pickupLat: json["pickup_lat"],
    pickupLong: json["pickup_long"],
    dropLat: json["drop_lat"],
    dropLong: json["drop_long"],
    estimatedFare: json["estimated_fare"],
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
    paymentType: json["payment_type"],
    paymentStatus: json["payment_status"],
    transactionId: json["transaction_id"],
    orderStatus: json["order_status"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_number": orderNumber,
    "user_id": userId,
    "service_tax": serviceTax,
    "total": total,
    "booking_date": bookingDate,
    "booking_date_id": bookingDateId,
    "vehicle": vehicle,
    "pickup_lat": pickupLat,
    "pickup_long": pickupLong,
    "drop_lat": dropLat,
    "drop_long": dropLong,
    "estimated_fare": estimatedFare,
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
    "payment_type": paymentType,
    "payment_status": paymentStatus,
    "transaction_id": transactionId,
    "order_status": orderStatus,
    "created_at": createdAt.toIso8601String(),
  };
}
