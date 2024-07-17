import 'package:flutter/material.dart';
import 'package:home_care/models/products.dart';
import 'package:home_care/screens/product.dart';

class ItemTile extends StatefulWidget {
  final Products product;
  const ItemTile({super.key, required this.product});

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  String _getDisplayName(String name) {
    if (name.length > 17) {
      return '${name.substring(0, 15)}..';
    } else {
      return name;
    }
  }

  String getTypeName(String type) {
    return type.split('.').last;
  }

  String getImagePath(String type) {
    switch (type) {
      case 'Television':
        return 'images/tv.png';
      case 'Refrigerator':
        return 'images/fridge.png';
      case 'AirConditioner':
        return 'images/ac.png';
      case 'WashingMachine':
        return 'images/wm.png';
      case 'Laptop':
        return 'images/laptop.png';
      case 'Speaker':
        return 'images/speaker.png';
      case 'VacuumCleaner':
        return 'images/vaccum.png';
      case 'Fan':
        return 'images/fan.png';
      default:
        return 'images/tv.png'; // Default image if type is not recognized
    }
  }

  @override
  Widget build(BuildContext context) {
    String typeName = getTypeName(widget.product.type.toString());
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              product: widget.product,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10.0, left: 5, right: 5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 243, 243),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      child: Image.asset(
                        getImagePath(typeName),
                        height: 80,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getDisplayName(widget.product.name),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          widget.product.location,
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          typeName,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.limeAccent,
                  shape: BoxShape.circle,
                ),
                child: Transform.rotate(
                  angle: 2.2, // Rotation angle in radians
                  child: const Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
