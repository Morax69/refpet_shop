import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:refpetshop/providers/cart_provider.dart';
import 'package:refpetshop/screens/cart/cart_bottom_checkout.dart';
import 'package:refpetshop/screens/cart/cart_widget.dart';
import 'package:refpetshop/services/assets_manager.dart';
import 'package:refpetshop/services/my_app_methods.dart';
import 'package:refpetshop/widgets/empty_widget_bag.dart';
import 'package:refpetshop/widgets/titles_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartitems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: "Keranjangmu masih Kosong",
              subtitle:
                  "Sepertinya kamu belum mengisinya. \nMulailah Berbelanja!",
              buttonText: "Belanja Sekarang",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppMethods.showErrorOrWarningDialog(
                        isError: false,
                        context: context,
                        subtitle: "Hapus Semua Item?",
                        fct: () {
                          cartProvider.clearLocalCart();
                        });
                  },
                  icon: const Icon(
                    IconlyLight.delete,
                    color: Colors.red,
                  ),
                )
              ],
              title: TitleTextWidget(
                  label: "Keranjang(${cartProvider.getCartitems.length})"),
              leading: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(AssetsManager.logoshop),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.getCartitems.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: cartProvider.getCartitems.values
                            .toList()
                            .reversed
                            .toList()[index],
                        child: const CartWidget(),
                      );
                    },
                  ),
                ),
              ],
            ),
            bottomSheet: BottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0), topRight: Radius.circular(0)),
              ),
              onClosing: () {},
              builder: (context) => const CartBottomCheckout(),
            ),
          );
  }
}
