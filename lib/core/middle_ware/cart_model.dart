class CartModel {
  int? totalprice;
  int? totalcount;
  int? cartId;
  int? cartUsersId;
  int? cartItemsId;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsImage;
  String? itemsDasc;
  String? itemsDascAr;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCat;

  CartModel({
    this.totalprice,
    this.totalcount,
    this.cartId,
    this.cartUsersId,
    this.cartItemsId,
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsImage,
    this.itemsDasc,
    this.itemsDascAr,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCat,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    totalprice = (json['totalprice'] as num?)?.toInt();
    totalcount = json['totalcount'];
    cartId = json['cart_id'];
    cartUsersId = json['cart_users_id'];
    cartItemsId = json['cart_items_id'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsImage = json['items_image'];
    itemsDasc = json['items_dasc'];
    itemsDascAr = json['items_dasc_ar'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalprice'] = totalprice;
    data['totalcount'] = totalcount;
    data['cart_id'] = cartId;
    data['cart_users_id'] = cartUsersId;
    data['cart_items_id'] = cartItemsId;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_image'] = itemsImage;
    data['items_dasc'] = itemsDasc;
    data['items_dasc_ar'] = itemsDascAr;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_cat'] = itemsCat;
    return data;
  }
}
