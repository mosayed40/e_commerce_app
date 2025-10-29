class CartModel {
  double? _askPrice;
  int? _numberOfPieces;
  int? _cartId;
  int? _cartUsersId;
  int? _cartItemsId;
  int? _cartOrders;
  int? _itemsId;
  String? _itemsName;
  String? _itemsNameAr;
  String? _itemsImage;
  String? _itemsDasc;
  String? _itemsDascAr;
  int? _itemsCount;
  int? _itemsActive;
  int? _itemsPrice;
  int? _itemsDiscount;
  String? _itemsDate;
  int? _itemsCat;

  CartModel({
    double? askPrice,
    int? numberOfPieces,
    int? cartId,
    int? cartUsersId,
    int? cartItemsId,
    int? cartOrders,
    int? itemsId,
    String? itemsName,
    String? itemsNameAr,
    String? itemsImage,
    String? itemsDasc,
    String? itemsDascAr,
    int? itemsCount,
    int? itemsActive,
    int? itemsPrice,
    int? itemsDiscount,
    String? itemsDate,
    int? itemsCat,
  }) {
    if (askPrice != null) {
      _askPrice = askPrice;
    }
    if (numberOfPieces != null) {
      _numberOfPieces = numberOfPieces;
    }
    if (cartId != null) {
      _cartId = cartId;
    }
    if (cartUsersId != null) {
      _cartUsersId = cartUsersId;
    }
    if (cartItemsId != null) {
      _cartItemsId = cartItemsId;
    }
    if (cartOrders != null) {
      _cartOrders = cartOrders;
    }
    if (itemsId != null) {
      _itemsId = itemsId;
    }
    if (itemsName != null) {
      _itemsName = itemsName;
    }
    if (itemsNameAr != null) {
      _itemsNameAr = itemsNameAr;
    }
    if (itemsImage != null) {
      _itemsImage = itemsImage;
    }
    if (itemsDasc != null) {
      _itemsDasc = itemsDasc;
    }
    if (itemsDascAr != null) {
      _itemsDascAr = itemsDascAr;
    }
    if (itemsCount != null) {
      _itemsCount = itemsCount;
    }
    if (itemsActive != null) {
      _itemsActive = itemsActive;
    }
    if (itemsPrice != null) {
      _itemsPrice = itemsPrice;
    }
    if (itemsDiscount != null) {
      _itemsDiscount = itemsDiscount;
    }
    if (itemsDate != null) {
      _itemsDate = itemsDate;
    }
    if (itemsCat != null) {
      _itemsCat = itemsCat;
    }
  }

  double? get askPrice => _askPrice;
  set askPrice(double? askPrice) => _askPrice = askPrice;
  int? get numberOfPieces => _numberOfPieces;
  set numberOfPieces(int? numberOfPieces) => _numberOfPieces = numberOfPieces;
  int? get cartId => _cartId;
  set cartId(int? cartId) => _cartId = cartId;
  int? get cartUsersId => _cartUsersId;
  set cartUsersId(int? cartUsersId) => _cartUsersId = cartUsersId;
  int? get cartItemsId => _cartItemsId;
  set cartItemsId(int? cartItemsId) => _cartItemsId = cartItemsId;
  int? get cartOrders => _cartOrders;
  set cartOrders(int? cartOrders) => _cartOrders = cartOrders;
  int? get itemsId => _itemsId;
  set itemsId(int? itemsId) => _itemsId = itemsId;
  String? get itemsName => _itemsName;
  set itemsName(String? itemsName) => _itemsName = itemsName;
  String? get itemsNameAr => _itemsNameAr;
  set itemsNameAr(String? itemsNameAr) => _itemsNameAr = itemsNameAr;
  String? get itemsImage => _itemsImage;
  set itemsImage(String? itemsImage) => _itemsImage = itemsImage;
  String? get itemsDasc => _itemsDasc;
  set itemsDasc(String? itemsDasc) => _itemsDasc = itemsDasc;
  String? get itemsDascAr => _itemsDascAr;
  set itemsDascAr(String? itemsDascAr) => _itemsDascAr = itemsDascAr;
  int? get itemsCount => _itemsCount;
  set itemsCount(int? itemsCount) => _itemsCount = itemsCount;
  int? get itemsActive => _itemsActive;
  set itemsActive(int? itemsActive) => _itemsActive = itemsActive;
  int? get itemsPrice => _itemsPrice;
  set itemsPrice(int? itemsPrice) => _itemsPrice = itemsPrice;
  int? get itemsDiscount => _itemsDiscount;
  set itemsDiscount(int? itemsDiscount) => _itemsDiscount = itemsDiscount;
  String? get itemsDate => _itemsDate;
  set itemsDate(String? itemsDate) => _itemsDate = itemsDate;
  int? get itemsCat => _itemsCat;
  set itemsCat(int? itemsCat) => _itemsCat = itemsCat;

  CartModel.fromJson(Map<String, dynamic> json) {
    _askPrice = (json['ask_price'] as num?)?.toDouble();
    _numberOfPieces = json['number_of_pieces'];
    _cartId = json['cart_id'];
    _cartUsersId = json['cart_users_id'];
    _cartItemsId = json['cart_items_id'];
    _cartOrders = json['cart_orders'];
    _itemsId = json['items_id'];
    _itemsName = json['items_name'];
    _itemsNameAr = json['items_name_ar'];
    _itemsImage = json['items_image'];
    _itemsDasc = json['items_dasc'];
    _itemsDascAr = json['items_dasc_ar'];
    _itemsCount = json['items_count'];
    _itemsActive = json['items_active'];
    _itemsPrice = json['items_price'];
    _itemsDiscount = json['items_discount'];
    _itemsDate = json['items_date'];
    _itemsCat = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ask_price'] = _askPrice;
    data['number_of_pieces'] = _numberOfPieces;
    data['cart_id'] = _cartId;
    data['cart_users_id'] = _cartUsersId;
    data['cart_items_id'] = _cartItemsId;
    data['cart_orders'] = _cartOrders;
    data['items_id'] = _itemsId;
    data['items_name'] = _itemsName;
    data['items_name_ar'] = _itemsNameAr;
    data['items_image'] = _itemsImage;
    data['items_dasc'] = _itemsDasc;
    data['items_dasc_ar'] = _itemsDascAr;
    data['items_count'] = _itemsCount;
    data['items_active'] = _itemsActive;
    data['items_price'] = _itemsPrice;
    data['items_discount'] = _itemsDiscount;
    data['items_date'] = _itemsDate;
    data['items_cat'] = _itemsCat;
    return data;
  }
}

class TotalValueOfTheCardProductModel {
  double? _totalprice;
  String? _totalcount;

  TotalValueOfTheCardProductModel({double? totalprice, String? totalcount}) {
    if (totalprice != null) {
      _totalprice = totalprice;
    }
    if (totalcount != null) {
      _totalcount = totalcount;
    }
  }

  double? get totalprice => _totalprice;
  set totalprice(double? totalprice) => _totalprice = totalprice;
  String? get totalcount => _totalcount;
  set totalcount(String? totalcount) => _totalcount = totalcount;

  TotalValueOfTheCardProductModel.fromJson(Map<String, dynamic> json) {
    _totalprice = (json['totalprice'] as num?)?.toDouble();
    _totalcount = json['totalcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalprice'] = _totalprice;
    data['totalcount'] = _totalcount;
    return data;
  }
}
