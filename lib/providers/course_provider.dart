import 'package:flutter/foundation.dart';

class CourseProvider extends ChangeNotifier {
  // Daftar data course menggunakan dynamic agar aman dari error tanda kurung sudut
  final List<dynamic> _courses = [
    {
      'code': 'MOB04',
      'title': 'Responsive Layout',
      'credits': 3,
      'instructor': 'Pak Agus',
      'desc': 'Mempelajari LayoutBuilder, MediaQuery, Expanded, dan GridView responsif.'
    },
    {
      'code': 'MOB05',
      'title': 'Navigation & Routing',
      'credits': 3,
      'instructor': 'Pak Sindu',
      'desc': 'Navigasi stack (push/pop), passing data, serta adaptive navigation.'
    },
    {
      'code': 'MOB06',
      'title': 'User Interaction',
      'credits': 2,
      'instructor': 'Pak YOTA',
      'desc': 'InkWell, GestureDetector, Button events, dan pengolahan gesture UI.'
    },
    {
      'code': 'MOB07',
      'title': 'Form & Validation',
      'credits': 3,
      'instructor': 'Bu Maria',
      'desc': 'Pembuatan form interaktif dengan TextFormField dan GlobalKey validation.'
    },
    {
      'code': 'MOB08',
      'title': 'Feedback & Dialogs',
      'credits': 2,
      'instructor': 'Pak Agus',
      'desc': 'Penerapan SnackBar, AlertDialog konfirmasi, dan progress loading.'
    },
  ];

  final Set<String> _favoriteCodes = {};

  List<dynamic> get courses => _courses;
  Set<String> get favoriteCodes => _favoriteCodes;

  void toggleFavorite(String code) {
    if (_favoriteCodes.contains(code)) {
      _favoriteCodes.remove(code);
    } else {
      _favoriteCodes.add(code);
    }
    notifyListeners();
  }
}