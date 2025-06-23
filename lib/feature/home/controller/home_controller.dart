import 'package:get/get.dart';
import 'package:prettyrini/feature/home/model/property_model.dart';

class PropertyController extends GetxController {
  var allProperties = <Property>[].obs;
  var filteredProperties = <Property>[].obs;
  var selectedCategory = 'All Categories'.obs;
  var searchQuery = ''.obs;

  // Filter settings
  var minBeds = 0.obs;
  var maxBeds = 5.obs;
  var minBaths = 0.obs;
  var maxBaths = 5.obs;
  var minSqft = 500.obs;
  var maxSqft = 5000.obs;
  var hasGarage = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Load dummy data
    allProperties.value = getDummyProperties();
    filteredProperties.value = allProperties;
  }

  // Filter properties based on selected category
  void filterByCategory(String category) {
    selectedCategory.value = category;
    applyFilters();
  }

  // Set search query
  void setSearchQuery(String query) {
    searchQuery.value = query;
    applyFilters();
  }

  // Apply all filters (category, search, and property filters)
  void applyFilters() {
    filteredProperties.value = allProperties.where((property) {
      // Filter by category
      if (selectedCategory.value != 'All Categories' &&
          property.listingType != selectedCategory.value) {
        return false;
      }

      // Filter by search query
      if (searchQuery.value.isNotEmpty &&
          !property.state.toLowerCase().contains(
                searchQuery.value.toLowerCase(),
              ) &&
          !property.city.toLowerCase().contains(
                searchQuery.value.toLowerCase(),
              )) {
        return false;
      }

      // Filter by property attributes
      if (property.beds < minBeds.value || property.beds > maxBeds.value) {
        return false;
      }
      if (property.baths < minBaths.value || property.baths > maxBaths.value) {
        return false;
      }
      if (property.sqft < minSqft.value || property.sqft > maxSqft.value) {
        return false;
      }
      if (hasGarage.value && property.garage == 0) {
        return false;
      }

      return true;
    }).toList();
  }

  // Set filter values and apply them
  void setFilters({
    int? minBeds,
    int? maxBeds,
    int? minBaths,
    int? maxBaths,
    int? minSqft,
    int? maxSqft,
    bool? hasGarage,
  }) {
    if (minBeds != null) this.minBeds.value = minBeds;
    if (maxBeds != null) this.maxBeds.value = maxBeds;
    if (minBaths != null) this.minBaths.value = minBaths;
    if (maxBaths != null) this.maxBaths.value = maxBaths;
    if (minSqft != null) this.minSqft.value = minSqft;
    if (maxSqft != null) this.maxSqft.value = maxSqft;
    if (hasGarage != null) this.hasGarage.value = hasGarage;

    applyFilters();
  }

  // Reset all filters
  void resetFilters() {
    selectedCategory.value = 'All Categories';
    searchQuery.value = '';
    minBeds.value = 0;
    maxBeds.value = 5;
    minBaths.value = 0;
    maxBaths.value = 5;
    minSqft.value = 500;
    maxSqft.value = 5000;
    hasGarage.value = false;

    applyFilters();
  }

  // Generate dummy property data
  List<Property> getDummyProperties() {
    return [
      Property(
        id: '1',
        address: '1046 Colony St',
        city: 'Maple Grove',
        state: 'CA',
        zipCode: '90210',
        price: 390000,
        listingType: 'For Sale',
        imageUrl: 'assets/images/state.png',
        beds: 3,
        baths: 2,
        sqft: 1290,
        garage: 2,
        stories: 2,
        yearBuilt: 2018,
        maintenanceFree: false,
        pricePerSqft: 302.3,
        status: 'Active',
      ),
      Property(
        id: '2',
        address: '742 Evergreen Terrace',
        city: 'Springfield',
        state: 'OR',
        zipCode: '97403',
        price: 425000,
        listingType: 'For Sale',
        imageUrl: 'assets/images/state.png',
        beds: 4,
        baths: 2,
        sqft: 1800,
        garage: 2,
        stories: 2,
        yearBuilt: 2015,
        maintenanceFree: true,
        pricePerSqft: 236.1,
        status: 'Active',
      ),
      Property(
        id: '3',
        address: '221B Baker St',
        city: 'London',
        state: 'TX',
        zipCode: '75001',
        price: 2500,
        listingType: 'For Rent',
        imageUrl: 'assets/images/state.png',
        beds: 2,
        baths: 1,
        sqft: 950,
        garage: 0,
        stories: 1,
        yearBuilt: 2005,
        maintenanceFree: true,
        pricePerSqft: 2.63,
        status: 'Active',
      ),
      Property(
        id: '4',
        address: '350 Fifth Avenue',
        city: 'New York',
        state: 'NY',
        zipCode: '10118',
        price: 1750000,
        listingType: 'For Sale',
        imageUrl: 'assets/images/state.png',
        beds: 5,
        baths: 4,
        sqft: 3500,
        garage: 2,
        stories: 3,
        yearBuilt: 2020,
        maintenanceFree: false,
        pricePerSqft: 500.0,
        status: 'Active',
      ),
      Property(
        id: '5',
        address: '123 Main St',
        city: 'Anytown',
        state: 'CA',
        zipCode: '90001',
        price: 1800,
        listingType: 'For Rent',
        imageUrl: 'assets/images/state.png',
        beds: 1,
        baths: 1,
        sqft: 750,
        garage: 1,
        stories: 1,
        yearBuilt: 2000,
        maintenanceFree: true,
        pricePerSqft: 2.4,
        status: 'Active',
      ),
      Property(
        id: '6',
        address: '456 Oak Ave',
        city: 'Riverdale',
        state: 'WA',
        zipCode: '98001',
        price: 550000,
        listingType: 'For Sale',
        imageUrl: 'assets/images/state.png',
        beds: 4,
        baths: 3,
        sqft: 2200,
        garage: 2,
        stories: 2,
        yearBuilt: 2019,
        maintenanceFree: false,
        pricePerSqft: 250.0,
        status: 'Active',
      ),
      Property(
        id: '7',
        address: '789 Pine Blvd',
        city: 'Mountain View',
        state: 'CA',
        zipCode: '94040',
        price: 3200,
        listingType: 'For Rent',
        imageUrl: 'assets/images/state.png',
        beds: 3,
        baths: 2,
        sqft: 1500,
        garage: 1,
        stories: 1,
        yearBuilt: 2010,
        maintenanceFree: true,
        pricePerSqft: 2.13,
        status: 'Inactive',
      ),
      Property(
        id: '8',
        address: '321 Elmwood Dr',
        city: 'Lakeside',
        state: 'FL',
        zipCode: '33101',
        price: 675000,
        listingType: 'For Sale',
        imageUrl: 'assets/images/state.png',
        beds: 5,
        baths: 3,
        sqft: 2800,
        garage: 3,
        stories: 2,
        yearBuilt: 2022,
        maintenanceFree: false,
        pricePerSqft: 241.1,
        status: 'Active',
      ),
    ];
  }
}
