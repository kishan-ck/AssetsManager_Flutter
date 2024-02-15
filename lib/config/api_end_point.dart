class APIEndPoints{
  ///Live baseurl
  static String baseUrl = "https://assetmanager-production.up.railway.app/api/v1";

  ///Local baseurl
  // static String baseUrl = "https://assetmanager-production.up.railway.app/api/v1";

  static String loginUrl = "/login";

  static String registerUrl = "/register";

  static String newsUrl = "/news";

  static String homeUrl = "/home";

  static String assetUrl = "/asset";

  static String categoryUrl = "/category";

  static String subCategoryUrl = "/subcategory";

  static String profileUrl({required int userId}) {
    return "/user_profile/$userId";
  }

}