import 'package:bee_coffee/models/cup_model.dart';
import 'package:bee_coffee/repository/cup_repository.dart';
import 'package:flutter/material.dart';

class MyDataProv with ChangeNotifier {

  final CupRepository _repository = CupRepository();

  List<List<CupModel>> _cupList = [];
  List<List<CupModel>> get getData => _cupList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  startLoad() {
    _isLoading = true;
    notifyListeners();

    _repository.getItems().then((data) {
      _cupList = data;
    print(data);
      _isLoading = false;
      notifyListeners();
    }
    ).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });
  }


  changeData(String newData) async  {
    // _cupList = await  getData();
    // _cupList = await _repository.getItems();

    _isLoading = true;
    notifyListeners();

    _repository.getItems().then((data) {
      _cupList = data;
      _isLoading = true;
      notifyListeners();
    }
    ).catchError((err) {
      _isLoading = false;
      notifyListeners();
    });


    // print(newData);
    // notifyListeners();
  }
}
