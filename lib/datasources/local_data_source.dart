import 'package:bee_coffee/models/cup_model.dart';

class LocalDataSource {
  List<List<CupModel>> getCupList() {
    List<CupModel> flyer1 = [
      CupModel(id: 1, status: _getRandomStatus(), typeCup: _getRandomTypeCup()),
      CupModel(id: 2, status: _getRandomStatus(), typeCup: _getRandomTypeCup()),
      CupModel(id: 3, status: _getRandomStatus(), typeCup: _getRandomTypeCup()),
      CupModel(id: 4, status: _getRandomStatus(), typeCup: _getRandomTypeCup()),
      CupModel(id: 5, status: _getRandomStatus(), typeCup: _getRandomTypeCup()),
      CupModel(id: 6, status: 'start', typeCup: 'gift'),
    ];

    List<CupModel> flyer2 = [
      CupModel(id: 7, status: 'static', typeCup: 'full'),
      CupModel(id: 8, status: 'static', typeCup: 'full'),
      CupModel(id: 9, status: 'static', typeCup: 'full'),
      CupModel(id: 10, status: 'static', typeCup: 'full'),
      CupModel(id: 11, status: 'static', typeCup: 'full'),
      CupModel(id: 12, status: 'static', typeCup: 'gift'),
    ];

    List<CupModel> flyer3 = [
      CupModel(id: 13, status: 'static', typeCup: 'full'),
      CupModel(id: 14, status: 'static', typeCup: 'full'),
      CupModel(id: 15, status: 'static', typeCup: 'full'),
      CupModel(id: 16, status: 'static', typeCup: 'full'),
      CupModel(id: 17, status: 'static', typeCup: 'full'),
      CupModel(id: 18, status: 'static', typeCup: 'gift'),
    ];

    List<List<CupModel>> list = [flyer1, flyer2, flyer3];
    return list;
  }

  String _getRandomStatus() {
    return (['start', 'change', 'static']..shuffle()).first;

    // final list = ['start', 'change'];
    // final _random = Random();
    // return list[_random.nextInt(list.length)];
  }

  String _getRandomTypeCup() {
    return (['empty', 'full']..shuffle()).first;
    // return (['empty', 'full', 'gift']..shuffle()).first;
  }
}
