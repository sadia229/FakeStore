import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductList extends StatelessWidget {
  final String? productName;
  final String? productPrice;
  final String? productImage;

  const ProductList({
    Key? key,
    this.productName,
    this.productPrice,
    this.productImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: ListTile(
        leading: Image.network(
          height: 50,
          width: 50,
          productImage.toString(),
        ),
        title: Text('$productName'),
        trailing: Text('$productPrice TK'),
      ),
    );
  }
}
