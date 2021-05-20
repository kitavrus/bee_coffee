import 'package:bee_coffee/datasources/local_data_source.dart';
import 'package:bee_coffee/models/cup_model.dart';

class CupRepository {
  final LocalDataSource _cupDataSource = LocalDataSource();

  Future<List<List<CupModel>>> getItems() async  {
    await new Future.delayed(Duration(seconds: 2));
    return _cupDataSource.getCupList();
  }
}
