import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final bool success;
  final String statusMessage;
  final String statusCode;

  const ErrorMessageModel(
      {required this.success,
      required this.statusMessage,
      required this.statusCode});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
          success: json['success'],
          statusCode: json['status_code'],
          statusMessage: json['status_message']);

  @override
  List<Object> get props => [success, statusMessage, statusCode];
}
