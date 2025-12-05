class AppLinkApi {
  static const String server = "http://192.168.1.2/e_commerce_app";
  static const String imageStatic = "http://192.168.1.2/e_commerce_app/upload";
  // Images
  static const String imagesCategoreis = "$imageStatic/categories";
  static const String imagesItems = "$imageStatic/items";

  //===============================================

  //Auth
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verfiycodeSignUp = "$server/auth/verfiycode.php";
  static const String resendVarfiyCode = "$server/auth/resend.php";

  //Forget Password
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String verfiycodeforgetpassword =
      "$server/forgetpassword/verfiycode.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";

  // Home
  static const String homepage = "$server/home.php";

  // Items
  static const String items = "$server/items/items.php";
  static const String searchItems = "$server/items/search.php";

  // favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String favoriteDelete =
      "$server/favorite/deletefromfavroite.php";

  // Cart
  static const String addToCart = "$server/cart/add.php";
  static const String deleteFromCart = "$server/cart/delete.php";
  static const String cartView = "$server/cart/view.php";
  static const String countItemsCart = "$server/cart/getcountitems.php";

  // Coupon => cart product details
  static const String checkCoupon = "$server/coupon/checkcoupon.php";

  // Order
  static const String checkOut = "$server/orders/checkout.php";
  static const String archive = "$server/orders/archive.php";
  static const String deleteOrders = "$server/orders/delete.php";
  static const String ordersDetails = "$server/orders/details.php";
  static const String pendingOrders = "$server/orders/pending.php";

  // address
  static const String addAddress = "$server/address/add.php";
  static const String eidtAddress = "$server/address/eidt.php";
  static const String deleteAddress = "$server/address/delete.php";
  static const String viewAddress = "$server/address/view.php";

  // Offers
  static const String offers = "$server/offer/offers.php";
  static const String ordersRating = "$server/rating.php";
  static const String searchOffres = "$server/offer/search.php";
}
