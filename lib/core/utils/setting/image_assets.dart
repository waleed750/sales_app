//! Based file path that has all images.
// ignore_for_file: library_private_types_in_public_api

const _filePath = "assets/images";

class AppImages {
  static _AppImagesPNG png = _AppImagesPNG();
  // static _AppImagesGIF gif = _AppImagesGIF();
  static _AppImagesSVG svg = _AppImagesSVG();
  // static _AppImagesJSON json = _AppImagesJSON();
  // static _AppImagesJPG jpg = _AppImagesJPG();
}

class _AppImagesPNG {
  ///png file path that has image has type [PNG]
  static String _filePathPNG(v) => "$_filePath/png/$v.png";
  String logo = _filePathPNG('logo');
  String registration = _filePathPNG('registration');
  String specialOffers = _filePathPNG('special_offers');
  String diorBanner = _filePathPNG('dior');
  String trendyBar = _filePathPNG('trendy_bar');
  String ceraveBanner = _filePathPNG('cerave');
  String categoryImage = _filePathPNG('category_image');
  String offersBar = _filePathPNG('offers_bar');

  //? add file path like 👇
  // String test = _filePathPNG('test');
}

// class _AppImagesGIF {
//   ///gif file path that has image has type [GIF]
//   static String _filePathGIF(v) => "$_filePath/gif/$v.gif";
//   // String test = _filePathGIF('test');
// }

// class _AppImagesJSON {
//   ///gif file path that has image has type [JSON]
//   static String _filePathJSON(v) => "$_filePath/json/$v.json";
//   // String test = _filePathJSON('test');
// }

class _AppImagesSVG {
  ///svg file path that has image has type [SVG]
  // static const _filePathSVG = "$_filePath/svg";
  static String _filePathSVG(v) => "$_filePath/svg/$v.svg";
  //? add file path like 👇
  String homeSelected = _filePathSVG('home_selected');
  String homeUnSelected = _filePathSVG('home_unselected');
  String searchSelected = _filePathSVG('search_selected');
  String searchUnSelected = _filePathSVG('search_unselected');
  String shoppingCartSelected = _filePathSVG('shopping_cart_selected');
  String shoppingCartUnSelected = _filePathSVG('shopping_cart_unselected');
  String heartSelected = _filePathSVG('heart_selected');
  String heartUnSelected = _filePathSVG('heart_unselected');
  String userSelected = _filePathSVG('user_selected');
  String userUnSelected = _filePathSVG('user_unselected');
  String bell = _filePathSVG('bell');
  String unitedArabEmiratesFlag = _filePathSVG('united_arab_emirates_flag');
  String egyptFlag = _filePathSVG('egypt_flag');
  String jamallekLogo = _filePathSVG('jamallek_logo');
  String home = _filePathSVG('home');
  String home2 = _filePathSVG('home2');
  String heart = _filePathSVG('heart');
  String heart2 = _filePathSVG('heart2');
  String profile = _filePathSVG('profile');
  String profile2 = _filePathSVG('profile2');
  String search = _filePathSVG('search');
  String search2 = _filePathSVG('search2');
  String shoppingCart = _filePathSVG('shopping_cart');
  String shoppingCart2 = _filePathSVG('shopping_cart2');
}

// class _AppImagesJPG {
//   ///png file path that has image has type [PNG]
//   // static const _filePathPNG = "$_filePath/png";
//   static String _filePathJPG(v) => "$_filePath/jpg/$v.jpg";

//   //? add file path like 👇
//   // String test = _filePathJPG('test');
// }
