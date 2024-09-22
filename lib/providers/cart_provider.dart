import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:refpetshop/models/cart_model.dart';
import 'package:refpetshop/providers/products_provider.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartitems {
    return _cartItems;
  }

  bool isProductInCart({required String productId}) {
    return _cartItems.containsKey(productId);
  }

  void addProductToCart({required String productId}) {
    _cartItems.putIfAbsent(
      productId,
      () => CartModel(
        cartId: const Uuid().v4(),
        productId: productId,
        quantity: 1,
      ),
    );
    notifyListeners();
  }

  void updateQuantity({required String productId, required int quantity}) {
    _cartItems.update(
      productId,
      (item) => CartModel(
        cartId: item.cartId,
        productId: productId,
        quantity: quantity,
      ),
    );
    notifyListeners();
  }

  double getTotal({required ProductProvider productProvider}) {
    double total = 0.0;

    _cartItems.forEach((key, value) {
      final getCurrProduct = productProvider.findByProdId(value.productId);
      if (getCurrProduct == null) {
        total += 0;
      } else {
        // Hapus pemisah ribuan (titik) sebelum parsing ke double
        String cleanPrice = getCurrProduct.productPrice.replaceAll('.', '');
        total += double.parse(cleanPrice) * value.quantity;
      }
    });
    return total;
  }

  void addOrRemoveFromCart({required String productId}) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.remove(productId);
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartModel(
          cartId: const Uuid().v4(),
          productId: productId,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  String formatRupiah(double amount) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp.',
      decimalDigits: 0, // Tidak ada digit desimal
    );
    return currencyFormatter.format(amount);
  }

  int getQty() {
    int total = 0;
    _cartItems.forEach((key, value) {
      total += value.quantity;
    });
    return total;
  }

  void removeOneItem({required String productId}) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearLocalCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
