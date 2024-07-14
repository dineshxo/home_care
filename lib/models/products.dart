class Products {
  String name;
  String location;
  DateTime purchasedDate;
  DateTime warrantyPeriod;
  int contactNumber;
  Category type;

  Products(
      {required this.name,
      required this.location,
      required this.purchasedDate,
      required this.contactNumber,
      required this.warrantyPeriod,
      required this.type});
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
