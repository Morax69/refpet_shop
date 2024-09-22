import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refpetshop/providers/viewed_prod_provider.dart';
import 'package:refpetshop/services/assets_manager.dart';
import 'package:refpetshop/services/my_app_methods.dart';
import 'package:refpetshop/widgets/empty_widget_bag.dart';
import 'package:refpetshop/widgets/products/products_widget.dart';
import 'package:refpetshop/widgets/titles_text.dart';

class RecentlyViewedScreen extends StatelessWidget {
  static const routeName = '/RecentlyViewedScreen';
  const RecentlyViewedScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    return viewedProdProvider.getviewedProdItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: "Terakhir dilihat(0)",
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
                        context: context,
                        subtitle: "Hapus riwayat?",
                        fct: () {
                          viewedProdProvider.clearLocalViewed();
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
                      "Terakhir Dilihat(${viewedProdProvider.getviewedProdItems.length})"),
              leading: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(AssetsManager.logoshop),
              ),
            ),
            body: DynamicHeightGridView(
              builder: (context, index) {
                return ProductWidget(
                  productId: viewedProdProvider.getviewedProdItems.values
                      .toList()[index]
                      .productId,
                );
              },
              itemCount: viewedProdProvider.getviewedProdItems.length,
              crossAxisCount: 2,
            ),
          );
  }
}
