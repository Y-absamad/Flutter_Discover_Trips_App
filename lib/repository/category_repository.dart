import 'package:discover_trips/models/category.dart';

class CategoryRepository {
  List<Category> get fetchAllCategory => _fetchAllCategory();

  List<Category> _fetchAllCategory() {
    return [
      Category(
        id: 1,
        name: 'الجبال',
        imageUrl:
            'https://images.unsplash.com/photo-1575728252059-db43d03fc2de?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NTh8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=',
      ),
      Category(
        id: 2,
        name: 'بحار وشواطئ',
        imageUrl:
            'https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8bGFrZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      ),
      Category(
        id: 3,
        name: 'بحيرات',
        imageUrl:
            'https://images.unsplash.com/photo-1493558103817-58b2924bce98?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTAxfHxiZWFjaHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      ),
      Category(
        id: 4,
        name: 'صحارى',
        imageUrl:
            'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZGVzZXJ0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      ),
      Category(
        id: 5,
        name: 'غابات',
        imageUrl:
            'https://images.unsplash.com/photo-1467269204594-9661b134dd2b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NjR8fHRyYXZlbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      ),
      Category(
        id: 6,
        name: 'شلالات',
        imageUrl:
            "https://images.pexels.com/photos/3672776/pexels-photo-3672776.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      ),
      Category(
        id: 7,
        name: 'جزر',
        imageUrl:
            "https://images.pexels.com/photos/1450353/pexels-photo-1450353.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      ),
   
      Category(
        id: 8,
        name: 'مدن تاريخية',
        imageUrl:
            "https://images.pexels.com/photos/356966/pexels-photo-356966.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      ),
      
    ];
  }
}
