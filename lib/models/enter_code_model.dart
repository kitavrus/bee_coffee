import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class EnterCodeModel extends Equatable {
  final int code;

  EnterCodeModel({@required this.code});

  @override
  List<Object> get props => [code];

  factory EnterCodeModel.fromJson(Map<String, dynamic> json) {
    return EnterCodeModel(
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
    };
  }
}
