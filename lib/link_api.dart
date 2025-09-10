class AppLinkApi {
  static const String server = "http://10.0.2.2/e_commerce_app";
  //
  static const String test = "$server/test.php";

  //Auth
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verfiycodeSignUp = "$server/auth/verfiycode.php";

  //Forget Password
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String verfiycodeforgetpassword =
      "$server/forgetpassword/verfiycode.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  // Home
  static const String homepage = "$server/home.php";
}
