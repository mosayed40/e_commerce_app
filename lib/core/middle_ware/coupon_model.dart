class CouponModel {
  int? _couponId;
  String? _couponName;
  int? _couponCount;
  int? _couponDiscount;
  String? _couponExpireDate;

  CouponModel({
    int? couponId,
    String? couponName,
    int? couponCount,
    int? couponDiscount,
    String? couponExpireDate,
  }) {
    if (couponId != null) {
      this._couponId = couponId;
    }
    if (couponName != null) {
      this._couponName = couponName;
    }
    if (couponCount != null) {
      this._couponCount = couponCount;
    }
    if (couponDiscount != null) {
      this._couponDiscount = couponDiscount;
    }
    if (couponExpireDate != null) {
      this._couponExpireDate = couponExpireDate;
    }
  }

  int? get couponId => _couponId;
  set couponId(int? couponId) => _couponId = couponId;
  String? get couponName => _couponName;
  set couponName(String? couponName) => _couponName = couponName;
  int? get couponCount => _couponCount;
  set couponCount(int? couponCount) => _couponCount = couponCount;
  int? get couponDiscount => _couponDiscount;
  set couponDiscount(int? couponDiscount) => _couponDiscount = couponDiscount;
  String? get couponExpireDate => _couponExpireDate;
  set couponExpireDate(String? couponExpireDate) =>
      _couponExpireDate = couponExpireDate;

  CouponModel.fromJson(Map<String, dynamic> json) {
    _couponId = json['coupon_id'];
    _couponName = json['coupon_name'];
    _couponCount = json['coupon_count'];
    _couponDiscount = json['coupon_discount'];
    _couponExpireDate = json['coupon_expire_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coupon_id'] = _couponId;
    data['coupon_name'] = _couponName;
    data['coupon_count'] = _couponCount;
    data['coupon_discount'] = _couponDiscount;
    data['coupon_expire_date'] = _couponExpireDate;
    return data;
  }
}
