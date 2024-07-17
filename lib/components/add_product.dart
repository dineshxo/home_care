import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:home_care/models/products.dart';
import 'package:home_care/services/firestore/firestore_services.dart';

class AddProductBottomSheet extends StatefulWidget {
  final Function onProductAdded;
  final String uid;

  const AddProductBottomSheet(
      {Key? key, required this.onProductAdded, required this.uid})
      : super(key: key);

  @override
  _AddProductBottomSheetState createState() => _AddProductBottomSheetState();
}

class _AddProductBottomSheetState extends State<AddProductBottomSheet> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _contactNumberController = TextEditingController();

  DateTime? _selectedPurchaseDate;
  DateTime? _selectedWarrantyPeriod;
  Category? _selectedCategory;

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _contactNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 20,
        left: 20,
        right: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _contactNumberController,
              decoration: InputDecoration(labelText: 'Contact Number'),
              keyboardType: TextInputType.phone,
            ),
            ListTile(
              title: Text(_selectedPurchaseDate == null
                  ? 'Select Purchase Date'
                  : DateFormat('yyyy-MM-dd').format(_selectedPurchaseDate!)),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedPurchaseDate = DateTime(
                        pickedDate.year, pickedDate.month, pickedDate.day);
                  });
                }
              },
            ),
            ListTile(
              title: Text(_selectedWarrantyPeriod == null
                  ? 'Select Warranty Period'
                  : DateFormat('yyyy-MM-dd').format(_selectedWarrantyPeriod!)),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedWarrantyPeriod = DateTime(
                        pickedDate.year, pickedDate.month, pickedDate.day);
                  });
                }
              },
            ),
            DropdownButton<Category>(
              hint: Text('Select Category'),
              value: _selectedCategory,
              onChanged: (Category? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: Category.values.map((Category category) {
                return DropdownMenuItem<Category>(
                  value: category,
                  child: Text(category.toString().split('.').last),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_nameController.text.isEmpty ||
                    _locationController.text.isEmpty ||
                    _contactNumberController.text.isEmpty ||
                    _selectedPurchaseDate == null ||
                    _selectedWarrantyPeriod == null ||
                    _selectedCategory == null) {
                  // Handle validation errors
                  return;
                }

                Products newProduct = Products(
                  uid: widget.uid,
                  name: _nameController.text,
                  location: _locationController.text,
                  purchasedDate: _selectedPurchaseDate!,
                  warrantyPeriod: _selectedWarrantyPeriod!,
                  contactNumber: int.parse(_contactNumberController.text),
                  type: _selectedCategory!,
                );

                await FirestoreService.addProduct(newProduct);
                widget.onProductAdded();
                Navigator.of(context).pop();
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
