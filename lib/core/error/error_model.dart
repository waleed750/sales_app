// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class ErrorResponseModel {
  final String? code;
  final String? message;
  final DataErrorModel? data;
  ErrorResponseModel({
    this.code,
    this.message,
    this.data,
  });

  ErrorResponseModel copyWith({
    String? code,
    String? message,
    DataErrorModel? data,
  }) {
    return ErrorResponseModel(
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory ErrorResponseModel.fromMap(Map<String, dynamic> map) {
    return ErrorResponseModel(
      code: map['code'] != null ? map['code'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? DataErrorModel.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorResponseModel.fromJson(String source) =>
      ErrorResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ErrorResponseModel(code: $code, message: $message, data: $data)';

  @override
  bool operator ==(covariant ErrorResponseModel other) {
    if (identical(this, other)) return true;

    return other.code == code && other.message == message && other.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode ^ data.hashCode;
}

class DataErrorModel {
  final int? status;
  DataErrorModel({
    this.status,
  });

  DataErrorModel copyWith({
    int? status,
  }) {
    return DataErrorModel(
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
    };
  }

  factory DataErrorModel.fromMap(Map<String, dynamic> map) {
    return DataErrorModel(
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataErrorModel.fromJson(String source) =>
      DataErrorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DataErrorModel(status: $status)';

  @override
  bool operator ==(covariant DataErrorModel other) {
    if (identical(this, other)) return true;

    return other.status == status;
  }

  @override
  int get hashCode => status.hashCode;
}
