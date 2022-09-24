class ApiPath {
  static String products() => 'products/';
  static String user(String userId) => 'users/$userId';
  static String addToCart(String userId, String addToCartID) =>
      'users/$userId/cart/$addToCartID'; //to test to push

static String MyProductsCart(String uid)=>'users/$uid/cart';
}
