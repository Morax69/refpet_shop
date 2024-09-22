import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refpetshop/providers/wishlist_provider.dart';
import 'package:refpetshop/services/assets_manager.dart';
import 'package:refpetshop/services/my_app_methods.dart';
import 'package:refpetshop/widgets/empty_widget_bag.dart';
import 'package:refpetshop/widgets/products/products_widget.dart';
import 'package:refpetshop/widgets/titles_text.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  const WishlistScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return wishlistProvider.getWishlistItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: "Kosong",
              subtitle:
                  "Sepertinya kamu belum mengisinya. \nKetuk icon hati pada produk untuk menambahkan favorit!",
              buttonText: "Belanja Sekarang",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppMethods.showErrorOrWarningDialog(
                        context: context,
                        subtitle: "Hapus barang?",
                        fct: () {
                          wishlistProvider.clearLocalWishlist();
                        });
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                )
              ],
              title: TitleTextWidget(
                  label:
                      "Favorit (${wishlistProvider.getWishlistItems.length})"),
              leading: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(AssetsManager.logoshop),
              ),
            ),
            body: DynamicHeightGridView(
              builder: (context, index) {
                return ProductWidget(
                  productId: wishlistProvider.getWishlistItems.values
                      .toList()[index]
                      .productId,
                );
              },
              itemCount: wishlistProvider.getWishlistItems.length,
              crossAxisCount: 2,
            ),
          );
  }
}


/*import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:refpetshop/widgets/products/products_widget.dart';
import 'package:refpetshop/widgets/titles_text.dart';

class WishlistScreen extends StatefulWidget {
  static const routeName = "/WishlistScreen";
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  late TextEditingController searchTextController;
  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TitleTextWidget(
            label: "Favorit(5)",
            fontSize: 20,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.canPop(context) ? Navigator.pop(context) : null;
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: DynamicHeightGridView(
                  builder: (context, index) {
                    return const ProductWidget();
                  },
                  itemCount: 30,
                  crossAxisCount: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/