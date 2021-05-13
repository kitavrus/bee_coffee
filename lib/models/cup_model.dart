import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CupModel extends Equatable {
  final int id;
  final String status;
  final String typeCup;
  final int qty;

  CupModel({
    @required this.id,
    @required this.status,
    @required this.typeCup,
    @required this.qty,
  });

  @override
  List<Object> get props => [id, status, typeCup, qty];

  factory CupModel.fromJson(Map<String, dynamic> json) {
    return CupModel(
      id: json['id'],
      status: json['status'],
      typeCup: json['typeCup'],
      qty: json['qty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'typeCup': typeCup,
      'qty': qty,
    };
  }
}
