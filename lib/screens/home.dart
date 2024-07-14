import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_care/repository/product_list.dart';
import 'package:home_care/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.limeAccent, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    color: Colors.black87,
                  )),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(children: [
            searchBar(),
          ]),
        ),
      ),
    );
  }
}

// child: Consumer<ThemeProvider>(
//               builder: (context, themeProvider, child) {
//                 return CupertinoSwitch(
//                   value: themeProvider.isDarkMode,
//                   onChanged: (value) {
//                     themeProvider.toggleTheme();
//                   },
//                 );
//               },
//             ),

Container searchBar() {
  return Container(
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 234, 234, 234),
      borderRadius: BorderRadius.circular(30),
    ),
    child: const TextField(
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.search_sharp,
          color: Color.fromARGB(255, 102, 102, 102),
        ),
        hintText: "Search..",
        hintStyle: TextStyle(color: Colors.black),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            vertical: 15), // Adjust the vertical padding here
      ),
    ),
  );
}
