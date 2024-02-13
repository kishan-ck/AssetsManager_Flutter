class APIEndPoints{
  ///baseurl
  static String baseUrl = "https://assetmanager-production.up.railway.app/api/v1";

  static String loginUrl = "/login";

  static String registerUrl = "/register";

  static String newsUrl = "/news";

  static String profileUrl({required int userId}) {
    return "/user_profile/$userId";
  }

}