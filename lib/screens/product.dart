import 'package:flutter/material.dart';
import 'package:home_care/models/products.dart';

class ProductPage extends StatefulWidget {
  final Products product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.product.name),
    );
  }
}
