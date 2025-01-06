import '../models/trip.dart';

import '../repository/category_repository.dart';
import '../models/category.dart';

class CategoryManager {
  final CategoryRepository _categoryRepository;
  final List<Trip> allTrips;
  CategoryManager(
      {required CategoryRepository categoryRepository, required this.allTrips})
      : _categoryRepository = categoryRepository;

  List<Category> getAllCategories() {
    return _categoryRepository.fetchAllCategory;
  }

  List<Category> get fetchAllCategories => getAllCategories();

  List<Trip> getTripsByCategory(int categoryId) {
    List<Trip> trips = allTrips.where((trip) => trip.categoryId == categoryId).toList();
    return trips;    
  }
}
