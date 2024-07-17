import 'package:flutter/material.dart';

class BottomAddBar extends StatefulWidget {
  final int productCount;
  final Function onTap;
  const BottomAddBar(
      {super.key, required this.productCount, required this.onTap});

  @override
  State<BottomAddBar> createState() => _BottomAddBarState();
}

class _BottomAddBarState extends State<BottomAddBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              "${widget.productCount} Accessories.",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {
                  widget.onTap();
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.limeAccent,
                  size: 35,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
