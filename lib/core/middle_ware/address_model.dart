class AddressModel {
  int? addressId;
  int? addressUsersId;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressName;
  int? addressPhone;

  AddressModel({
    this.addressId,
    this.addressUsersId,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.addressName,
    this.addressPhone,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUsersId = json['address_users_id'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressName = json['address_name'];
    addressPhone = json['address_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
