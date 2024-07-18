import 'package:flutter/material.dart';
import 'package:home_care/models/products.dart';
import 'package:home_care/utils/product_utils.dart';
import 'package:intl/intl.dart';

class ProductPage extends StatefulWidget {
  final Products product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    String type = ProductUtils.getTypeName(widget.product.type.toString());
    String imgPath = ProductUtils.getImagePath(type);
    double screenHeight = MediaQuery.of(context).size.height;
    String purchasedDate =
        DateFormat.yMMMd().format(widget.product.purchasedDate);
    String warranty = DateFormat.yMMMd().format(widget.product.warrantyPeriod);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.blue,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imgPath,
              width: double.infinity,
              height: screenHeight / 3,
            ),
            Text(
              widget.product.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(type),
            Text(widget.product.location),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.red,
                  child: Row(
                    children: [
                      Container(
                        color: Colors.amber,
                        child: const Column(
                          children: [
                            Text("Usage"),
                            Text(
                              "Usage",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.amber,
                        child: const Column(
                          children: [
                            Text("Usage"),
                            Text(
                              "Usage",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(purchasedDate),
            Text(warranty)
          ],
        ),
      ),
    );
  }
}
