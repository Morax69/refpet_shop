import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refpetshop/providers/cart_provider.dart';
import 'package:refpetshop/providers/products_provider.dart';
import 'package:refpetshop/widgets/subtitles_text.dart';
import 'package:refpetshop/widgets/titles_text.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: TitleTextWidget(
                          label:
                              "Total (${cartProvider.getCartitems.length} Orderan/${cartProvider.getQty()} item)"),
                    ),
                    SubtitlesTextWidget(
                      label: cartProvider.formatRupiah(cartProvider.getTotal(
                          productProvider: productProvider)),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Bayar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // Mengatur warna latar belakang menjadi biru
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
