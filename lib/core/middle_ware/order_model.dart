class OrdersModel {
  int? ordersId;
  int? ordersUsersId;
  int? ordersAddress;
  double? ordersPrice;
  int? ordersPriceDelivery;
  int? ordersCoupon;
  double? ordersTotalPrice;
  String? ordersPaymentMethod;
  String? ordersDateTime;
  int? ordersStatus;
  double? ordersRating;
  String? ordersNoterating;
  int? addressId;
  int? addressUsersId;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressName;
  int? addressPhone;

  OrdersModel({
    this.ordersId,
    this.ordersUsersId,
    this.ordersAddress,
    this.ordersPrice,
    this.ordersPriceDelivery,
    this.ordersCoupon,
    this.ordersTotalPrice,
    this.ordersPaymentMethod,
    this.ordersDateTime,
    this.ordersStatus,
    this.ordersRating,
    this.ordersNoterating,
    this.addressId,
    this.addressUsersId,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.addressName,
    this.addressPhone,
  });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersId = json['orders_users_id'];
    ordersAddress = json['orders_address'];
    ordersPrice = (json['orders_price'] as num?)?.toDouble();
    ordersPriceDelivery = json['orders_price_delivery'];
    ordersCoupon = json['orders_coupon'];
    ordersTotalPrice = (json['orders_total_price'] as num?)?.toDouble();
    ordersPaymentMethod = json['orders_payment_method'];
    ordersDateTime = json['orders_date_time'];
    ordersStatus = json['orders_status'];
    ordersRating = (json['orders_rating'] as num?)?.toDouble();
    ordersNoterating = json['orders_noterating'];
    addressId = json['address_id'];
    addressUsersId = json['address_users_id'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = (json['address_lat'] as num?)?.toDouble();
    addressLong = (json['address_long'] as num?)?.toDouble();
    addressName = json['address_name'];
    addressPhone = json['address_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_users_id'] = ordersUsersId;
    data['orders_address'] = ordersAddress;
    data['orders_price'] = ordersPrice;
    data['orders_price_delivery'] = ordersPriceDelivery;
    data['orders_coupon'] = ordersCoupon;
    data['orders_total_price'] = ordersTotalPrice;
    data['orders_payment_method'] = ordersPaymentMethod;
    data['orders_date_time'] = ordersDateTime;
    data['orders_status'] = ordersStatus;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoterating;
    data['address_id'] = addressId;
    data['address_users_id'] = addressUsersId;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_name'] = addressName;
    data['address_phone'] = addressPhone;
    return data;
  }
}
