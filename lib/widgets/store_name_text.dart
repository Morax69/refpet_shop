import 'package:flutter/material.dart';

class StoreNameWidget extends StatelessWidget {
  final String storeName;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;

  const StoreNameWidget({
    Key? key,
    required this.storeName,
    this.color,
    this.fontSize = 10,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8), // Spasi antara ikon dan nama toko
        Text(
          storeName,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}
