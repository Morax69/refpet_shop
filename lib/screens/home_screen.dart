import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refpetshop/consts/app_constants.dart';
import 'package:refpetshop/providers/products_provider.dart';
import 'package:refpetshop/services/assets_manager.dart';
import 'package:refpetshop/widgets/app_name_text.dart';
import 'package:refpetshop/widgets/products/ctg_rounded_widget.dart';
import 'package:refpetshop/widgets/products/laters_arrival_product_widget.dart';
import 'package:refpetshop/widgets/titles_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(AssetsManager.logoshop),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.24,
                child: Swiper(
                  itemBuilder: (context, index) {
                    return Image.asset(
                      AppConstants.bannersImages[index],
                      fit: BoxFit
                          .cover, // Menambahkan fit untuk memastikan gambar menyesuaikan container
                    );
                  },
                  itemCount: AppConstants.bannersImages.length,
                  autoplay: true,
                  pagination: const SwiperPagination(
                    alignment: Alignment
                        .bottomCenter, // Pastikan posisi pagination sudah benar
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.red, // Warna titik aktif
                      color: Colors.grey, // Warna titik tidak aktif
                      size: 10.0, // Ukuran titik tidak aktif
                      activeSize: 12.0, // Ukuran titik aktif
                    ),
                  ), // Menambahkan pagination untuk navigasi yang lebih jelas
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const TitleTextWidget(
                label: "Produk Terbaru",
                fontSize: 22,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: size.height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: productProvider.getProducts[index],
                      child: const LatersArrivalProductWidget(),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const TitleTextWidget(
                label: "Kategori",
                fontSize: 22,
              ),
              const SizedBox(
                height: 15,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: List.generate(
                  AppConstants.categoriesList.length,
                  (index) {
                    return CategoryRoundedWidget(
                      image: AppConstants.categoriesList[index].images,
                      name: AppConstants.categoriesList[index].name,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
