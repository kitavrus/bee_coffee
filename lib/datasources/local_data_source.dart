import 'package:bee_coffee/models/cup_model.dart';

class LocalDataSource {
  List<CupModel> getCupList() {
    return [
      CupModel(id: 1, status: 'start', typeCup: 'empty', qty: 1),
      CupModel(id: 1, status: 'start', typeCup: 'empty', qty: 1),
      CupModel(id: 1, status: 'start', typeCup: 'empty', qty: 1),
      CupModel(id: 1, status: 'start', typeCup: 'empty', qty: 1),
      CupModel(id: 1, status: 'start', typeCup: 'empty', qty: 1),
      CupModel(id: 1, status: 'start', typeCup: 'gift', qty: 1),
    ];
  }
}
