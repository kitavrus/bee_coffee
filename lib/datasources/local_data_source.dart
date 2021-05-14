import 'package:bee_coffee/models/cup_model.dart';

class LocalDataSource {
  List<CupModel> getCupList() {
    return [
      CupModel(id: 1, status: _getRandomStatus(), typeCup: 'empty'),
      CupModel(id: 2, status: _getRandomStatus(), typeCup: 'empty'),
      CupModel(id: 3, status: 'start', typeCup: _getRandomTypeCup()),
      CupModel(id: 4, status: 'start', typeCup: _getRandomTypeCup()),
      CupModel(id: 5, status: 'start', typeCup: 'empty'),
      CupModel(id: 6, status: 'start', typeCup: 'gift'),
    ];
  }

  String _getRandomStatus() {
    return (['start', 'change']..shuffle()).first;

    // final list = ['start', 'change'];
    // final _random = Random();
    // return list[_random.nextInt(list.length)];
  }

  String _getRandomTypeCup() {
    return (['empty', 'full', 'gift']..shuffle()).first;
  }
}
