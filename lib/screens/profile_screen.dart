import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refpetshop/providers/theme_provider.dart';
import 'package:refpetshop/screens/auth/login.dart';
import 'package:refpetshop/screens/inner_screens/viewed.recently.dart';
import 'package:refpetshop/screens/inner_screens/wishlish_screen.dart';
import 'package:refpetshop/services/assets_manager.dart';
import 'package:refpetshop/widgets/app_name_text.dart';
import 'package:refpetshop/widgets/custom_list_tile.dart';
import 'package:refpetshop/widgets/subtitles_text.dart';
import 'package:refpetshop/widgets/titles_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(AssetsManager.logoshop),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Visibility(
              visible: false,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child:
                    TitleTextWidget(label: "Silahkan Login Terlebih Dahulu!"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.surface,
                        width: 3,
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://www.rochester.edu/newscenter/wp-content/uploads/2018/05/duchenne-smile.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextWidget(label: "Eddie Brian"),
                      SubtitlesTextWidget(label: "sardo265@gmail.com"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
              child: Column(
                children: [
                  const TitleTextWidget(label: "Umum"),
                  CustomListTile(
                    imagePath: AssetsManager.orderBag,
                    text: "Semua Pesanan",
                    function: () {},
                  ),
                  CustomListTile(
                    imagePath: AssetsManager.wishlist,
                    text: "Favorit",
                    function: () {
                      Navigator.pushNamed(context, WishlistScreen.routeName);
                    },
                  ),
                  CustomListTile(
                    imagePath: AssetsManager.recent,
                    text: "Dilihat Baru-baru ini",
                    function: () {
                      Navigator.pushNamed(
                          context, RecentlyViewedScreen.routeName);
                    },
                  ),
                  CustomListTile(
                    imagePath: AssetsManager.address,
                    text: "Alamat",
                    function: () {},
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TitleTextWidget(label: "Pengaturan"),
                  SwitchListTile(
                    title: Text(themeProvider.getIsDarkTheme
                        ? "Dark Mode"
                        : "Light Mode"),
                    value: themeProvider.getIsDarkTheme,
                    onChanged: (value) {
                      themeProvider.setDarkTheme(themevalue: value);
                    },
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      icon: const Icon(Icons.login),
                      label: const Text("Login"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
