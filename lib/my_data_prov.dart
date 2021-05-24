import 'package:bee_coffee/models/cup_model.dart';
import 'package:bee_coffee/repository/cup_repository.dart';
import 'package:flutter/material.dart';

class MyDataProv with ChangeNotifier {

  final CupRepository _repository = CupRepository();

  List<List<CupModel>> _cupList = [];
  List<List<CupModel>> get getData => _cupList;

  String _phoneNumber = '';
  String get getPhoneNumber => _phoneNumber;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  startLoad() {
    _isLoading = true;
    notifyListeners();
    print("startLoad");
    _repository.getItems().then((data) {
      _cupList = data;
      print("startLoad OK");
    print(data);
      _isLoading = false;
      notifyListeners();
    }
    ).catchError((err) {
      _isLoading = false;
      print("startLoad catchError");
      notifyListeners();
    });
  }


  changeData(String newData) async  {
    _isLoading = true;
    notifyListeners();
    print(newData);
    print("changeData");
    _repository.getItems().then((data) {
      _cupList = data;
      _isLoading = false;
      notifyListeners();
      print("changeData OK");
    }
    ).catchError((err) {
      _isLoading = false;
      print("changeData catchError");
      notifyListeners();
    });
  }
}
