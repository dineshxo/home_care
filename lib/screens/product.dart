import 'package:flutter/material.dart';

import 'package:home_care/components/call_button.dart';
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
    String contactNumber = widget.product.contactNumber.toString();

    bool checkWarrantyExpiration(DateTime warrantyPeriod) {
      DateTime currentDate = DateTime.now();
      return currentDate.isAfter(warrantyPeriod);
    }

    bool isExpired = checkWarrantyExpiration(widget.product.warrantyPeriod);

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imgPath,
                width: double.infinity,
                height: screenHeight / 2.5,
              ),
              Text(
                widget.product.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                type,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: screenHeight / 6,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.amberAccent.shade100
                                    .withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Location - ",
                                  style: TextStyle(
                                    // color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  widget.product.location,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Purchased $purchasedDate",
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: screenHeight / 6,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: isExpired
                                    ? Colors.redAccent.shade100.withOpacity(0.6)
                                    : Colors.greenAccent.shade100
                                        .withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Warranty - ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  isExpired ? "Expired" : "Active",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Coverage valid til  $warranty",
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CallButton(contactNumber: contactNumber)
            ],
          ),
        ),
      ),
    );
  }
}
