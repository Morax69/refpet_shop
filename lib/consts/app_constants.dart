import 'package:refpetshop/models/category_model.dart';
import 'package:refpetshop/services/assets_manager.dart';

class AppConstants {
  static String productImageUrl =
      "https://shop.annam-gourmet.com/pub/media/catalog/product/cache/d37736df50be6680bb835be65e27017a/F/1/F142468_20e6.png";

  static List<String> bannersImages = [
    AssetsManager.banner1,
    AssetsManager.banner2,
    AssetsManager.banner3,
  ];

  static List<CategoryModel> categoriesList = [
    CategoryModel(
      id: "Anjing",
      images: AssetsManager.anjing,
      name: "Anjing",
    ),
    CategoryModel(
      id: "Kucing",
      images: AssetsManager.kucing,
      name: "Kucing",
    ),
    CategoryModel(
      id: "Burung",
      images: AssetsManager.burung,
      name: "Burung",
    ),
    CategoryModel(
      id: "Kandang",
      images: AssetsManager.kandang,
      name: "Kandang",
    ),
    CategoryModel(
      id: "Makanan",
      images: AssetsManager.petfoot,
      name: "Makanan",
    ),
    CategoryModel(
      id: "Sabun",
      images: AssetsManager.sabun,
      name: "Sabun",
    ),
    CategoryModel(
      id: "Vaksin/Obat",
      images: AssetsManager.obat,
      name: "Vaksin/Obat",
    ),
    CategoryModel(
      id: "Lainnya",
      images: AssetsManager.other,
      name: "Lainnya",
    ),
  ];
}
