import 'package:flutter/foundation.dart';
import '../models/course.dart';
import '../repositories/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository repository;

  CourseProvider(this.repository);

  List<Course> _courses = [];
  bool _isLoading = false;
  String? _error;

  final Set<String> _favoriteCodes = {};

  List<Course> get courses => _courses;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Set<String> get favoriteCodes => _favoriteCodes;

  // Fungsi untuk mengambil data secara asynchronous melalui repository
  Future<void> loadCourses() async {
    _isLoading = true;
    _error = null;
    notifyListeners(); // Memicu UI untuk menampilkan loading state

    try {
      _courses = await repository.getCourses();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners(); // Memicu UI untuk memperbarui tampilan setelah data/error didapat
    }
  }

  void toggleFavorite(String code) {
    if (_favoriteCodes.contains(code)) {
      _favoriteCodes.remove(code);
    } else {
      _favoriteCodes.add(code);
    }
    notifyListeners();
  }
}