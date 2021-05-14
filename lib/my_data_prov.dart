import 'package:bee_coffee/models/cup_model.dart';
import 'package:bee_coffee/repository/cup_repository.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class MyDataProv with ChangeNotifier {
  List<List<CupModel>> _cupList;

  final CupRepository _repository = CupRepository();

  MyDataProv() {
    _cupList = _repository.getItems();
  }

  List<List<CupModel>> get getData => _cupList;

  void changeData(String newData) {
    _cupList = _repository.getItems();
    print(newData);
    notifyListeners();
  }
}
