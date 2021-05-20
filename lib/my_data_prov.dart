import 'package:bee_coffee/models/cup_model.dart';
import 'package:bee_coffee/repository/cup_repository.dart';
import 'package:flutter/material.dart';

class MyDataProv with ChangeNotifier {
  List<List<CupModel>> _cupList = [];

  final CupRepository _repository = CupRepository();

  void _initCupList () async {
    _cupList = await _repository.getItems();
  }

  MyDataProv()  {
     // _cupList =  _repository.getItems();
    _initCupList();
  }

  // List<List<CupModel>> get getData => _cupList;
  Future<List<List<CupModel>>> getData() async => _cupList =  await  _repository.getItems();

  changeData(String newData) async  {
    // _cupList = await  getData();
    _cupList = await _repository.getItems();
    print(newData);
    notifyListeners();
  }
}
