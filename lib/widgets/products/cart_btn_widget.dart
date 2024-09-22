import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refpetshop/providers/cart_provider.dart';

class CartButtonWidget extends StatefulWidget {
  final double size;
  final Color colors;
  final String productId;
  const CartButtonWidget({
    super.key,
    this.size = 22,
    this.colors = Colors.transparent,
    required this.productId,
  });

  @override
  State<CartButtonWidget> createState() => _CartButtonWidgetState();
}

class _CartButtonWidgetState extends State<CartButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final isInCart = cartProvider.isProductInCart(productId: widget.productId);
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
          setState(() {
            cartProvider.addOrRemoveFromCart(productId: widget.productId);
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(
                    isInCart
                        ? Icons.remove_shopping_cart
                        : Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    isInCart
                        ? 'dihapus dari keranjang'
                        : 'Berhasil ditambahkan',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Ubah warna teks
                    ),
                  ),
                ],
              ),
              backgroundColor: isInCart ? Colors.redAccent : Colors.green,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
        icon: Icon(
            cartProvider.isProductInCart(productId: widget.productId)
                ? Icons.check
                : Icons.add_shopping_cart_outlined,
            size: widget.size,
            color: cartProvider.isProductInCart(productId: widget.productId)
                ? Colors.blue
                : Colors.grey),
      ),
    );
  }
}
