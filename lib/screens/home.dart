import 'package:flutter/material.dart';
import 'package:home_care/components/add_product.dart';
import 'package:home_care/components/bottom_add_bar.dart';
import 'package:home_care/components/item_tile.dart';
import 'package:home_care/models/products.dart';
import 'package:home_care/services/auth/authentication.dart';
import 'package:home_care/services/firestore/firestore_services.dart';
import 'package:home_care/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final String uid;

  const Home({super.key, required this.uid});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Products>> _products;
  int _productsCount = 0;

  @override
  void initState() {
    super.initState();
    _refreshProducts();
  }

  void _refreshProducts() {
    setState(() {
      _products = FirestoreService.fetchProducts(widget.uid);
    });

    // Update count after products are fetched
    _products.then((products) {
      updateCount(products.length);
    });
  }

  void updateCount(int length) {
    setState(() {
      _productsCount = length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Care",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, bottom: 12.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    'images/avatar.jpg',
                    height: 45,
                    width: 45,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return Container(
                      decoration: BoxDecoration(
                        color: themeProvider.isDarkMode
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 213, 213, 213),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          themeProvider.toggleTheme();
                        },
                        icon: themeProvider.isDarkMode
                            ? const Icon(
                                Icons.light_mode,
                                color: Colors.black87,
                              )
                            : const Icon(
                                Icons.dark_mode,
                                color: Color.fromARGB(221, 81, 81, 81),
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            searchBar(),
            const SizedBox(
              height: 3,
            ),
            Expanded(
              child: FutureBuilder<List<Products>>(
                future: _products,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No products found.'));
                  }

                  List<Products> products = snapshot.data!;

                  return Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            Products product = products[index];
                            return ItemTile(product: product);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Text("Logged in as ${widget.uid}"),
            TextButton(
              onPressed: () {
                final auth = AuthServices();
                auth.signOut();
              },
              child: Text('Logout'),
            ),
            BottomAddBar(
              productCount: _productsCount,
              onTap: () {
                _showAddProductBottomSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddProductBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return AddProductBottomSheet(
          onProductAdded: _refreshProducts,
          uid: widget.uid,
        );
      },
    );
  }
}

Container searchBar() {
  return Container(
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 234, 234, 234),
      borderRadius: BorderRadius.circular(30),
    ),
    child: const TextField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search_sharp,
          color: Color.fromARGB(255, 102, 102, 102),
        ),
        hintText: "Search..",
        hintStyle: TextStyle(color: Colors.black),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          vertical: 15,
        ),
      ),
    ),
  );
}
