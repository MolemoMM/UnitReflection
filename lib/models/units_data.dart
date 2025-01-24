import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

// Initials and Surname: M.Mamashela


class UnitsData with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';

  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;
  int _choicenum = 0;

  int get choicenum => _choicenum;

  set choicenum(int choicenum) {
    _choicenum = choicenum;
    notifyListeners();
  }

  Future<void> get fetchData async {
    final response = await get(
      Uri.parse(
          'https://dl.dropbox.com/s/bqop1r0plejx1ez/Units%201-3.json?dl=0'),
    );

    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Check internet connection';
      _map = {};
    }
    notifyListeners();
  }

  void initialValues() {
    _map = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}
