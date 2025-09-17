class ApiEndpoints {
  static const String baseUrl = 'https://dummyjson.com';
  
  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/users/add';
  static const String refreshToken = '/auth/refresh';
  
  // Product endpoints
  static const String products = '/products';
  static String productById(int id) => '/products/$id';
  static String productsByCategory(String category) => '/products/category/$category';
  static String searchProducts(String query) => '/products/search?q=$query';
  
  // User endpoints
  static const String userProfile = '/auth/me';
}
