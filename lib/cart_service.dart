class CartService {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> product) {
    final index = _cartItems.indexWhere((item) => item['id'] == product['id']);
    if (index != -1) {
      _cartItems[index]['quantity'] += 1;
    } else {
      final item = Map<String, dynamic>.from(product);
      item['quantity'] = 1;
      _cartItems.add(item);
    }
  }

  void removeFromCart(int productId) {
    _cartItems.removeWhere((item) => item['id'] == productId);
  }

  void clearCart() {
    _cartItems.clear();
  }
}
