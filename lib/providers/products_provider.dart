import 'package:flutter/material.dart';
import 'package:refpetshop/models/products_model.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> get getProducts {
    return _products;
  }

  ProductModel? findByProdId(String productId) {
    if (_products.where((element) => element.productId == productId).isEmpty) {
      return null;
    }
    return _products.firstWhere((element) => element.productId == productId);
  }

  List<ProductModel> findByCategory({required String ctgName}) {
    List<ProductModel> ctgList = _products
        .where((element) => element.productCategory
            .toLowerCase()
            .contains(ctgName.toLowerCase()))
        .toList();

    return ctgList;
  }

  List<ProductModel> searchQuery(
      {required String searchText, required List<ProductModel> passedList}) {
    List<ProductModel> searchList = passedList
        .where((element) => element.productTitle
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();
    return searchList;
  }

  final List<ProductModel> _products = [
    // Anjing
    ProductModel(
      //1
      productStore: 'Palementer Petshop',
      productId: 'iphone14-128gb-black',
      productTitle: "Jual French Bulldog Puppies, Anakan INA Ch.",
      productPrice: "1.500.000",
      productCategory: "Anjing",
      productDescription:
          "Kualitas Bagus Tanggal Lahir: 9 Februari 2024, 3 Betina, Obat cacing, Divaksinasi, Microchip dan Stambum",
      productImage:
          "https://cdn.anjingdijual.com/img/pics/2024/07/28/154013/53adbe93c011bd9de6cda545f49aa1f6.jpg",
      productQuantity: "10",
    ),
    ProductModel(
      //2
      productStore: 'Palementer Petshop',
      productId: 'iphone13-mini-256gb-midnight',
      productTitle:
          "iPhone 13 Mini, 256GB, Midnight - Unlocked (Renewed Premium)",
      productPrice: "659.99",
      productCategory: "Anjing",
      productDescription:
          "5.4 Super Retina XDR display. 5G Superfast downloads, high quality streaming. Cinematic mode in 1080p at 30 fps. Dolby Vision HDR video recording up to 4K at 60 fps. 2X Optical zoom range. A15 Bionic chip. New 6-core CPU with 2 performance and 4 efficiency cores. New 4-core GPU. New 16-core Neural Engine. Up to 17 hours video playback. Face ID. Ceramic Shield front. Aerospace-grade aluminum. Water resistant to a depth of 6 meters for up to 30 minutes. Compatible with MagSafe makanan and wireless chargers.",
      productImage:
          "https://cdn.anjingdijual.com/img/pics/2024/09/16/155221/2afe76a58ace4f087f43995b0f0825ac.jpg",
      productQuantity: "15",
    ),
    ProductModel(
      //3
      productStore: 'Palementer Petshop',
      productId: 'Acheter un iPhone 14',
      productTitle: "iPhone 14",
      productPrice: "1199.99",
      productCategory: "Anjing",
      productDescription:
          "Les détails concernant la livraison dans votre région s’afficheront sur la page de validation de la commande.",
      productImage:
          "https://cdn.anjingdijual.com/img/pics/2024/08/29/154802/b9d214d16ce6c61916d3d8a5b950be02.jpg",
      productQuantity: "144",
    ),
    ProductModel(
      //4
      productStore: 'Palementer Petshop',
      productId: const Uuid().v4(),
      productTitle:
          "Samsung Galaxy S22 Ultra 5G - 256GB - Phantom Black (Unlocked)",
      productPrice: "1199.99",
      productCategory: "Anjing",
      productDescription:
          "About this item\n6.8 inch Dynamic AMOLED 2X display with a 3200 x 1440 resolution\n256GB internal storage, 12GB RAM\n108MP triple camera system with 100x Space Zoom and laser autofocus\n40MP front-facing camera with dual pixel AF\n5000mAh battery with fast wireless charging and wireless power share\n5G capable for lightning fast download and streaming",
      productImage:
          "https://cdn.anjingdijual.com/img/pics/2024/06/11/152938/07a51b2e678cbc51d4b71ce401f5e45a.jpg",
      productQuantity: "2363",
    ),
    ProductModel(
      //5
      productStore: 'Palementer Petshop',
      productId: const Uuid().v4(),
      productTitle:
          "Samsung Galaxy S21 Ultra 5G | Factory Unlocked Android Cell Phone | US Version 5G Smartphone",
      productPrice: "1199.99",
      productCategory: "Anjing",
      productDescription:
          "About this item\nPro Grade Camera: Zoom in close with 100X Space Zoom, and take photos and videos like a pro with our easy-to-use, multi-lens camera.\n100x Zoom: Get amazing clarity with a dual lens combo of 3x and 10x optical zoom, or go even further with our revolutionary 100x Space Zoom.\nHighest Smartphone Resolution: Crystal clear 108MP allows you to pinch, crop and zoom in on your photos to see tiny, unexpected details, while lightning-fast Laser Focus keeps your focal point clear\nAll Day Intelligent Battery: Intuitively manages your cellphone’s usage, so you can go all day without charging (based on average battery life under typical usage conditions).\nPower of 5G: Get next-level power for everything you love to do with Samsung Galaxy 5G; More sharing, more gaming, more experiences and never miss a beat",
      productImage:
          "https://cdn.anjingdijual.com/img/pics/2024/08/24/153848/e65c2daf60600793099d68556f03b211-small.jpg",
      productQuantity: "3625",
    ),
    ProductModel(
      //6
      productStore: 'Palementer Petshop',
      productId: const Uuid().v4(),
      productTitle:
          "OnePlus 9 Pro 5G LE2120 256GB 12GB RAM Factory Unlocked (GSM Only | No CDMA - not Compatible with Verizon/Sprint) International Version - Morning Mist",
      productPrice: "1099.99",
      productCategory: "Anjing",
      productDescription:
          "About this item\n6.7 inch LTPO Fluid2 AMOLED, 1B colors, 120Hz, HDR10+, 1300 nits (peak)\n256GB internal storage, 12GB RAM\nQuad rear camera: 48MP, 50MP, 8MP, 2MP\n16MP front-facing camera\n4500mAh battery with Warp Charge 65T (10V/6.5A) and 50W Wireless Charging\n5G capable for lightning fast download and streaming",
      productImage:
          "https://cdn.anjingdijual.com/img/pics/2024/08/28/154778/a59ab67873f8a83c92f2f24829cb5cc8-small.jpg",
      productQuantity: "3636",
    ),

    ProductModel(
      //7
      productStore: 'Palementer Petshop',
      productId: const Uuid().v4(),
      productTitle: "Samsung Galaxy Z Flip3 5G",
      productPrice: "999.99",
      productCategory: "Anjing",
      productDescription:
          "About this item\nGet the latest Galaxy experience on your phone.\nFOLDING DISPLAY - Transform the way you capture, share and experience content.\nCAPTURE EVERYTHING - With the wide-angle camera and the front camera, take stunning photos and videos from every angle.\nWATER RESISTANT - Use your Galaxy Z Flip3 5G even when it rains.\nONE UI 3.1 - Enjoy the Galaxy Z Flip3 5G’s sleek, premium design and all the features you love from the latest One UI 3.1. ",
      productImage:
          "https://cdn.anjingdijual.com/img/pics/2024/08/31/154843/0db5093fddb0735d494aee7930a20c48-small.jpg",
      productQuantity: "525",
    ),
    ProductModel(
      //8
      productStore: 'Palementer Petshop',
      productId: const Uuid().v4(),
      productTitle: "Apple introduces iPhone 14 and iPhone 14 Plus",
      productPrice: "1199.99",
      productCategory: "Anjing",
      productDescription:
          "A new, larger 6.7-inch size joins the popular 6.1-inch design, featuring a new dual-camera system, Crash Detection, a smartphone industry-first safety service with Emergency SOS via satellite, and the best battery life on iPhone",
      productImage:
          "https://cdn.anjingdijual.com/img/pics/2024/08/26/154693/ea9c64da5cddf1c0b12868b4aab185d3-small.jpg",
      productQuantity: "2526",
    ),
    ProductModel(
      //9
      productStore: 'Palementer Petshop',
      productId: const Uuid().v4(),
      productTitle: "Xiaomi Redmi Note 10 Pro",
      productPrice: "249.99",
      productCategory: "Anjing",
      productDescription:
          "About this item\n6.67-inch 120Hz AMOLED display with TrueColor\n108MP quad rear camera system with 8K video support\nQualcomm Snapdragon 732G processor\n5020mAh (typ) high-capacity battery\n33W fast charging support and 33W fast charger included in the box",
      productImage:
          "https://cdn.anjingdijual.com/img/pics/2024/08/30/154825/c4071ae2fbd82c71f37d55f85bbc1221-small.jpg",
      productQuantity: "353",
    ),
    ProductModel(
      //10
      productStore: 'Palementer Petshop',
      productId: const Uuid().v4(),
      productTitle: "OnePlus 10 Pro 5G",
      productPrice: "899.99",
      productCategory: "Anjing",
      productDescription:
          "About this item\n6.7 inch Fluid AMOLED Display with LTPO, 120 Hz refresh rate, 10-bit color, HDR10+, and adaptive refresh rate\nQualcomm Snapdragon 8 Gen 1 with Adreno 730 GPU\n4500 mAh battery with Warp Charge 65T (10V/6.5A) + Wireless Warp Charge 50\n256GB Internal Storage | 12GB RAM\nOxygenOS 12 based on Android 12 with Play Store",
      productImage:
          "https://cdn.anjingdijual.com/img/pics/2024/08/24/154609/8fb9e28ae735f32e630532274f20eb4b-small.jpg",
      productQuantity: "3873",
    ),
    ProductModel(
      //11
      productStore: 'Palementer Petshop',
      productId: const Uuid().v4(),
      productTitle: "Google Pixel 6",
      productPrice: "799.99",
      productCategory: "Anjing",
      productDescription:
          "About this item\nPowered by Google Tensor chip, designed for mobile, the Google Pixel 6 delivers exceptional AI-powered experiences.\n6.4-inch Full HD+ display with 90Hz refresh rate and HDR10+.\n50MP + 12MP dual rear camera system, 4K/60fps video recording.\n8MP front camera with Night Sight, portrait mode and more.\nBuilt-in Titan M2 security chip for advanced security.\nAndroid 12 OS with three years of updates and monthly security patches.",
      productImage:
          "https://cdn.anjingdijual.com/img/pics/2024/07/21/153838/50ad986a7813a9cb39c7c52532a71958-small.jpg",
      productQuantity: "62332",
    ),
  ];
}
