import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:refpetshop/providers/wishlist_provider.dart';

class HeartButtoWidget extends StatefulWidget {
  final double size;
  final Color colors;
  final String productId;
  const HeartButtoWidget({
    super.key,
    this.size = 22,
    this.colors = Colors.transparent,
    required this.productId,
  });

  @override
  State<HeartButtoWidget> createState() => _HeartButtoWidgetState();
}

class _HeartButtoWidgetState extends State<HeartButtoWidget> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.colors,
      ),
      child: IconButton(
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
        ),
        onPressed: () {
          wishlistProvider.addOrRemoveFromWishlist(
            productId: widget.productId,
          );
        },
        icon: Icon(
          wishlistProvider.isProductInWishlist(productId: widget.productId)
              ? IconlyBold.heart
              : IconlyLight.heart,
          size: widget.size,
          color:
              wishlistProvider.isProductInWishlist(productId: widget.productId)
                  ? Colors.red
                  : Colors.grey,
        ),
      ),
    );
  }
}
