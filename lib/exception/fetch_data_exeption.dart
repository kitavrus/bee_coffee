import 'dart:core';


class FetchDataException implements Exception {
  final _message;

  FetchDataException(this._message);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}