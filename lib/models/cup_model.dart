import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CupModel extends Equatable {
  final int id;
  final String status;
  final String typeCup;

  CupModel({
    @required this.id,
    @required this.status,
    @required this.typeCup,
  });

  @override
  List<Object> get props => [id, status, typeCup];

  factory CupModel.fromJson(Map<String, dynamic> json) {
    return CupModel(
      id: json['id'],
      status: json['status'],
      typeCup: json['typeCup'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'typeCup': typeCup,
    };
  }
}
