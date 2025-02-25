import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final Cart _cart = Cart();
  final List<Product> _fav = [];

  Cart get cart => _cart;
  List<Product> get favorites => _fav;

  void addToFavorites(Product product) {
    Product targetProduct = product;
    targetProduct.favorite = true;
    _fav.add(targetProduct);
    notifyListeners();
  }

  void removeFromFavorites(int id) {
    _fav.removeWhere((Product product) => product.id == id);
    notifyListeners();
  }

  void addToCart(Product product, {int quantity = 1}) {
    // Provided as a hint
    final existingItem = _cart.items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: Product.empty(), quantity: 0),
    );

    if (existingItem.product.id != -1) {
      existingItem.quantity += quantity;
    } else {
      _cart.items.add(CartItem(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  void removeFromCart(int productId) {
    // TODO: Remove item with matching productId from cart
    _cart.items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void updateQuantity(int productId, int newQuantity) {
    // TODO: Update quantity for item with productId
    // TODO: If quantity <= 0, remove the item
    if (newQuantity <= 0) {
      _cart.items
          .removeWhere((CartItem cartItem) => cartItem.product.id == productId);
    } else {
      _cart.items.map((CartItem cartItem) {
        if (cartItem.product.id == productId) {
          return cartItem.quantity = newQuantity;
        }
        return cartItem;
      }).toList();
    }
    notifyListeners();
  }

  void clearCart() {
    // TODO: Clear the cart
    _cart.items.clear();
    notifyListeners();
  }
}
