import 'package:flutter/material.dart';
import 'package:refpetshop/models/wishlist_model.dart';
import 'package:uuid/uuid.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, WishlistModel> _wistlistItems = {};
  Map<String, WishlistModel> get getWishlistItems {
    return _wistlistItems;
  }

  bool isProductInWishlist({required String productId}) {
    return _wistlistItems.containsKey(productId);
  }

  void addOrRemoveFromWishlist({required String productId}) {
    if (_wistlistItems.containsKey(productId)) {
      _wistlistItems.remove(productId);
    } else {
      _wistlistItems.putIfAbsent(
        productId,
        () => WishlistModel(
          id: const Uuid().v4(),
          productId: productId,
        ),
      );
    }
    notifyListeners();
  }

  void clearLocalWishlist() {
    _wistlistItems.clear();
    notifyListeners();
  }
}
