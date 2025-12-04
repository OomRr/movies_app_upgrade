import '../network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}
//this is if we use local data source
class LocalDatabaseException implements Exception {
  final ErrorMessageModel errorMessageModel;

  LocalDatabaseException({required this.errorMessageModel});
}
