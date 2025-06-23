class Property {
  final String id;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final double price;
  final String listingType; // For Sale, For Rent, etc.
  final String imageUrl;
  final int beds;
  final int baths;
  final int sqft;
  final int garage;
  final int stories;
  final int yearBuilt;
  final bool maintenanceFree;
  final double pricePerSqft;
  final String status; // Active or Inactive

  Property({
    required this.id,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.price,
    required this.listingType,
    required this.imageUrl,
    required this.beds,
    required this.baths,
    required this.sqft,
    required this.garage,
    required this.stories,
    required this.yearBuilt,
    required this.maintenanceFree,
    required this.pricePerSqft,
    required this.status,
  });

  String get location => '$city, $state $zipCode';
}
