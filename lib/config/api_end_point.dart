class APIEndPoints{
  ///baseurl
  static String baseUrl = "http://3.136.67.35/api/v1";

  static String loginUrl = "/login";

  static String registerUrl = "/register";

  static String resendOTPUrl = "/resend_otp";

  static String verifyOTPUrl = "/verify_otp";

  static String forgotPasswordUrl = "/request_otp";

  static String createNewPasswordUrl = "/create_new_password";

  static String getRestaurantUrl = "/load_restaurant";

  static String getSearchRestaurantUrl = "/search_restaurant";

  static String getSingleSearchRestaurantUrl = "/single_search_restaurant";

  static String getDirectionDetailsUrl = "/restaurant_directions";

  static String restaurantDetailsUrl = "/restaurant_details";

  static String logOutUrl = "/logout";

  static String socialLoginUrl = "/social_login";

  static String profileUrl({required int userId}) {
    return "/user_profile/$userId";
  }

  static String updateProfile = "/update_profile";

  static String suggestionListUrl = "/suggestion_list";

  static String cmsPageUrl = "/page_list";

}