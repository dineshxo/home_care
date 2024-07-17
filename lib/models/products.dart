class Products {
  String uid;
  String name;
  String location;
  DateTime purchasedDate;
  DateTime warrantyPeriod;
  int contactNumber;
  Category type;

  Products(
      {required this.uid,
      required this.name,
      required this.location,
      required this.purchasedDate,
      required this.contactNumber,
      required this.warrantyPeriod,
      required this.type});

  // Convert a Products instance to a map
  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'name': name,
      'location': location,
      'purchasedDate': _toDateOnly(purchasedDate),
      'warrantyPeriod': _toDateOnly(warrantyPeriod),
      'contactNumber': contactNumber,
      'type': type.toString().split('.').last, // Store enum as a string
    };
  }

  // Convert a Firestore document to a Products instance
  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      uid: map['uid'],
      name: map['name'],
      location: map['location'],
      purchasedDate: DateTime.parse(map['purchasedDate']),
      warrantyPeriod: DateTime.parse(map['warrantyPeriod']),
      contactNumber: map['contactNumber'],
      type: Category.values
          .firstWhere((e) => e.toString().split('.').last == map['type']),
    );
  }

  // Helper method to format DateTime to date-only string
  String _toDateOnly(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day)
        .toIso8601String();
  }
}

enum Category {
  Television,
  Refrigerator,
  Microwave,
  AirConditioner,
  WashingMachine,
  Laptop,
  Smartphone,
  Tablet,
  Speaker,
  Router,
  VacuumCleaner,
  Fan,
  Heater,
  CoffeeMaker,
  Blender,
  Toaster,
  Oven,
}
