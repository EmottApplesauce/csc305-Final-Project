import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import 'flutter_flow/flutter_flow_util.dart';

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

  DocumentReference? _selectedTop;
  DocumentReference? get selectedTop => _selectedTop;
  set selectedTop(DocumentReference? value) {
    _selectedTop = value;
  }

  DocumentReference? _selectedBottom;
  DocumentReference? get selectedBottom => _selectedBottom;
  set selectedBottom(DocumentReference? value) {
    _selectedBottom = value;
  }

  DocumentReference? _selectedShoes;
  DocumentReference? get selectedShoes => _selectedShoes;
  set selectedShoes(DocumentReference? value) {
    _selectedShoes = value;
  }

  String _currentSlot = '';
  String get currentSlot => _currentSlot;
  set currentSlot(String value) {
    _currentSlot = value;
  }
}
