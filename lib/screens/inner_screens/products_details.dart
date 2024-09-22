import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refpetshop/providers/cart_provider.dart';
import 'package:refpetshop/providers/products_provider.dart';
import 'package:refpetshop/widgets/app_name_text.dart';
import 'package:refpetshop/widgets/products/heart_btn_widget.dart';
import 'package:refpetshop/widgets/store_name_text.dart';
import 'package:refpetshop/widgets/subtitles_text.dart';
import 'package:refpetshop/widgets/titles_text.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = "/ProductDetails";

  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findByProdId(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    final isInCart = cartProvider.isProductInCart(productId: productId);

    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: getCurrentProduct!.productImage,
              height: size.height * 0.38,
              width: double.infinity,
              boxFit: BoxFit.contain,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.store,
                        size: 20, // Ikon toko
                        color: Color.fromARGB(255, 159, 43,
                            104), // Kamu bisa ganti warna sesuai keinginan
                      ),
                      StoreNameWidget(
                        storeName: getCurrentProduct
                            .productStore, // Ambil nama toko dari product
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          getCurrentProduct.productTitle,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SubtitlesTextWidget(
                        label: "Rp.${getCurrentProduct.productPrice}",
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HeartButtoWidget(
                          productId: getCurrentProduct.productId,
                          colors: const Color.fromARGB(255, 23, 25, 120),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: kBottomNavigationBarHeight - 10,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  cartProvider.addOrRemoveFromCart(
                                      productId: getCurrentProduct.productId);
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
                                              ? 'Dihapus dari keranjang'
                                              : 'Berhasil ditambahkan',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Colors.white, // Ubah warna teks
                                          ),
                                        ),
                                      ],
                                    ),
                                    backgroundColor: isInCart
                                        ? Colors.redAccent
                                        : Colors.green,
                                    behavior: SnackBarBehavior.floating,
                                    duration: const Duration(seconds: 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                cartProvider.isProductInCart(
                                        productId: getCurrentProduct.productId)
                                    ? Icons.check
                                    : Icons.add_shopping_cart_rounded,
                              ),
                              label: Text(cartProvider.isProductInCart(
                                      productId: getCurrentProduct.productId)
                                  ? "Telah ditambahkan"
                                  : "Tambahkan"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleTextWidget(label: "Tentang..."),
                      SubtitlesTextWidget(
                          label: getCurrentProduct.productCategory),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SubtitlesTextWidget(
                      label: getCurrentProduct.productDescription),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
