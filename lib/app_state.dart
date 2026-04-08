import 'package:flutter/material.dart';
import '/backend/schema/enums/enums.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  Category? _category = Category.Top;
  Category? get category => _category;
  set category(Category? value) {
    _category = value;
  }

  double _temp = 0.0;
  double get temp => _temp;
  set temp(double value) {
    _temp = value;
  }

  String _weathericon = '';
  String get weathericon => _weathericon;
  set weathericon(String value) {
    _weathericon = value;
  }

  String _weatherDescription = '';
  String get weatherDescription => _weatherDescription;
  set weatherDescription(String value) {
    _weatherDescription = value;
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
  }
}
