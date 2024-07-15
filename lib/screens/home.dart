import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_care/repository/product_list.dart';
import 'package:home_care/services/auth/authentication.dart';
import 'package:home_care/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final String uid;
  const Home({super.key, required this.uid});

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
                SizedBox(
                  width: 5,
                ),
                Consumer<ThemeProvider>(
                    builder: (context, themeProvider, child) {
                  return Container(
                      decoration: BoxDecoration(
                          color: (themeProvider.isDarkMode)
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : Color.fromARGB(255, 213, 213, 213),
                          shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {
                            themeProvider.toggleTheme();
                          },
                          icon: (themeProvider.isDarkMode)
                              ? const Icon(
                                  Icons.light_mode,
                                  color: Colors.black87,
                                )
                              : const Icon(
                                  Icons.dark_mode,
                                  color: Color.fromARGB(221, 81, 81, 81),
                                )));
                }),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(children: [
            searchBar(),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(productList[index].name);
                  },
                  itemCount: productList.length),
            ),
            Text("logged as ${widget.uid}"),
            TextButton(
                onPressed: () {
                  final auth = AuthServices();
                  auth.signOut();
                },
                child: Text('Logout'))
          ]),
        ),
      ),
    );
  }
}

// child:  CupertinoSwitch(
//                   value: themeProvider.isDarkMode,
//                   onChanged: (value) {
//
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
