import 'package:e_commerce_app/core/class/c_r_u_d.dart';
import 'package:e_commerce_app/link_api.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);

  checkOutOrders(
    int usersid,
    int addressId,
    int deliveryPrice,
    int couponId,
    int couponDiscount,
    double priceOrder,
    String paymentMethod,
  ) async {
    var response = await crud.postData(AppLinkApi.checkOut, {
      "users_id": usersid.toString(),
      "address_id": addressId.toString(),
      "price_delivery": deliveryPrice.toString(),
      "coupon_id": couponId.toString(),
      "coupon_discount": couponDiscount.toString(),
      "orders_price": priceOrder.toString(),
      "payment_method": paymentMethod.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteOrders(int orderId) async {
    var response = await crud.postData(AppLinkApi.deleteOrders, {
      "id": orderId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  orderDetails(int orderId) async {
    var response = await crud.postData(AppLinkApi.ordersDetails, {
      "id": orderId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  pendingOrders(int usersid) async {
    var response = await crud.postData(AppLinkApi.pendingOrders, {
      "user_id": usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
