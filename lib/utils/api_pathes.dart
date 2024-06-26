class ApiPathes{
  static String products()=>'products/';
  static String product(String id)=>'products/$id';
  static String user(String uid)=>'users/$uid';
  static String getcartItems(String uid)=>'users/$uid/cartItems/';
  static String cartItem(String uid, String cartItemId) =>
      'users/$uid/cartItems/$cartItemId';
  static String getAddresses(String uid) =>
      'users/$uid/addresses/';
        static String getPaymentMethods(String uid) =>
    'users/$uid/paymentmethods/';
      static String announcements()=>'announcements/';
      static String categories()=>'categories/';
      static String getFavoritesItems(String uid)=>'users/$uid/favoritItems/';
       static String favoriteItem(String uid, String favoriteItemId) =>
      'users/$uid/favoritItems/$favoriteItemId';
}