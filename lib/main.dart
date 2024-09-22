import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refpetshop/consts/theme_data.dart';
import 'package:refpetshop/providers/cart_provider.dart';
import 'package:refpetshop/providers/products_provider.dart';
import 'package:refpetshop/providers/theme_provider.dart';
import 'package:refpetshop/providers/viewed_prod_provider.dart';
import 'package:refpetshop/providers/wishlist_provider.dart';
import 'package:refpetshop/root_screen.dart';
import 'package:refpetshop/screens/auth/forgot_password.dart';
import 'package:refpetshop/screens/auth/login.dart';
import 'package:refpetshop/screens/auth/register.dart';
import 'package:refpetshop/screens/inner_screens/products_details.dart';
import 'package:refpetshop/screens/inner_screens/viewed.recently.dart';
import 'package:refpetshop/screens/inner_screens/wishlish_screen.dart';
import 'package:refpetshop/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ViewedProdProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (
          context,
          themeProvider,
          child,
        ) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: Style.themeData(
                isDarkTheme: themeProvider.getIsDarkTheme, context: context),
            home: const RootScreen(),
            routes: {
              ProductDetails.routeName: (context) => const ProductDetails(),
              WishlistScreen.routeName: (context) => const WishlistScreen(),
              RecentlyViewedScreen.routeName: (context) =>
                  const RecentlyViewedScreen(),
              LoginScreen.routeName: (context) => const LoginScreen(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              ForgotPasswordScreen.routeName: (context) =>
                  const ForgotPasswordScreen(),
              SearchScreen.routeName: (context) => const SearchScreen(),
            },
          );
        },
      ),
    );
  }
}
