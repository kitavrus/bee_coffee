import 'package:bee_coffee/models/cup_model.dart';

class LocalDataSource {
  List<List<CupModel>> getCupList() {
    // List<int> a = [1, 2, 3];
    // List<int> b = [4, 5];
    // List<int> c = [6];
    // List<List<int>> list = [
    //   [1, 2, 3],
    //   b,
    //   c
    // ];
    //
    // print(list);

    List<CupModel> flyer1 = [
      CupModel(id: 1, status: _getRandomStatus(), typeCup: 'empty'),
      CupModel(id: 2, status: _getRandomStatus(), typeCup: 'empty'),
      CupModel(id: 3, status: 'start', typeCup: _getRandomTypeCup()),
      CupModel(id: 4, status: 'start', typeCup: _getRandomTypeCup()),
      CupModel(id: 5, status: 'start', typeCup: 'empty'),
      CupModel(id: 6, status: 'start', typeCup: 'gift'),
    ];

    List<CupModel> flyer2 = [
      CupModel(id: 1, status: _getRandomStatus(), typeCup: 'empty'),
      CupModel(id: 2, status: _getRandomStatus(), typeCup: 'empty'),
      CupModel(id: 3, status: 'start', typeCup: _getRandomTypeCup()),
      CupModel(id: 4, status: 'start', typeCup: _getRandomTypeCup()),
      CupModel(id: 5, status: 'start', typeCup: 'empty'),
      CupModel(id: 6, status: 'start', typeCup: 'gift'),
    ];

    List<List<CupModel>> list = [flyer1, flyer2];
    // List<List<CupModel>> list = [];
    // list.add(flyer1);
    // list.add(flyer2);

    // print(list);
    // print("-----------------");

    return list;

    // return [
    //   CupModel(id: 1, status: _getRandomStatus(), typeCup: 'empty'),
    //   CupModel(id: 2, status: _getRandomStatus(), typeCup: 'empty'),
    //   CupModel(id: 3, status: 'start', typeCup: _getRandomTypeCup()),
    //   CupModel(id: 4, status: 'start', typeCup: _getRandomTypeCup()),
    //   CupModel(id: 5, status: 'start', typeCup: 'empty'),
    //   CupModel(id: 6, status: 'start', typeCup: 'gift'),
    // ];
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
