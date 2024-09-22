import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refpetshop/models/products_model.dart';
import 'package:refpetshop/screens/inner_screens/products_details.dart';
import 'package:refpetshop/widgets/products/cart_btn_widget.dart';
import 'package:refpetshop/widgets/products/heart_btn_widget.dart';
import 'package:refpetshop/widgets/subtitles_text.dart';

class LatersArrivalProductWidget extends StatelessWidget {
  const LatersArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.routeName,
              arguments: productModel.productId);
        },
        child: SizedBox(
          width: size.width * 0.45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FancyShimmerImage(
                    imageUrl: productModel.productImage,
                    width: size.width * 0.28,
                    height: size.height * 0.28,
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.productTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          HeartButtoWidget(
                            productId: productModel.productId,
                          ),
                          CartButtonWidget(
                            productId: productModel.productId,
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: SubtitlesTextWidget(
                        label: "Rp.${productModel.productPrice}",
                        color: Colors.blue,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
