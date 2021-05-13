import 'package:bee_coffee/datasources/local_data_source.dart';
import 'package:bee_coffee/models/cup_model.dart';

class CupRepository {
  final LocalDataSource _cupDataSource = LocalDataSource();

  List<CupModel> getItems() {
    return _cupDataSource.getCupList();
  }
}
