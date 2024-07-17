import 'package:home_care/models/products.dart';

List<Products> productList = [
  Products(
    name: 'Samsung TV',
    location: 'Living Room',
    purchasedDate: DateTime(2023, 5, 15),
    warrantyPeriod: DateTime(2028, 5, 15),
    contactNumber: 1234567890,
    type: Category.Television,
  ),
  Products(
    name: 'Whirlpool Refrigerator',
    location: 'Kitchen',
    purchasedDate: DateTime(2022, 9, 20),
    warrantyPeriod: DateTime(2027, 9, 20),
    contactNumber: 9876543210,
    type: Category.Refrigerator,
  ),
  Products(
    name: 'Apple MacBook Pro',
    location: 'Home Office',
    purchasedDate: DateTime(2023, 1, 10),
    warrantyPeriod: DateTime(2026, 1, 10),
    contactNumber: 1357924680,
    type: Category.Laptop,
  ),
  Products(
    name: 'Apple MacBook Pro',
    location: 'Home Office',
    purchasedDate: DateTime(2023, 1, 10),
    warrantyPeriod: DateTime(2026, 1, 10),
    contactNumber: 1357924680,
    type: Category.Laptop,
  ),
  // Add more Products as needed
];
