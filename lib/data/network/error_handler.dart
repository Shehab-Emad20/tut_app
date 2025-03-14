import 'package:dio/dio.dart';
import 'package:tut_app/data/network/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.defaultError.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return Failure(
            error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "",
          );
        } else {
          return DataSource.defaultError.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.cancel.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.defaultError.getFailure();
      case DioExceptionType.unknown:
        return DataSource.defaultError.getFailure();
    }
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseCodeMessage.success);
      case DataSource.noContent:
        return Failure(ResponseCode.noContent, ResponseCodeMessage.noContent);
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseCodeMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseCodeMessage.forbidden);
      case DataSource.unauthorized:
        return Failure(
          ResponseCode.unauthorized,
          ResponseCodeMessage.unauthorized,
        );
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseCodeMessage.notFound);
      case DataSource.internalServerError:
        return Failure(
          ResponseCode.internalServerError,
          ResponseCodeMessage.internalServerError,
        );
      case DataSource.connectTimeout:
        return Failure(
          ResponseCode.connectTimeout,
          ResponseCodeMessage.connectTimeout,
        );
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseCodeMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(
          ResponseCode.receiveTimeout,
          ResponseCodeMessage.receiveTimeout,
        );
      case DataSource.sendTimeout:
        return Failure(
          ResponseCode.sendTimeout,
          ResponseCodeMessage.sendTimeout,
        );
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseCodeMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(
          ResponseCode.noInternetConnection,
          ResponseCodeMessage.noInternetConnection,
        );
      case DataSource.defaultError:
        return Failure(
          ResponseCode.defaultError,
          ResponseCodeMessage.defaultError,
        );
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int forbidden = 403; // failure, API rejected request
  static const int unauthorized = 401; // failure user is not authorised
  static const int internalServerError = 500; // failure, crash in server side

  static const int defaultError = -1; // local status code
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
  static const int notFound = -8;
}

class ResponseCodeMessage {
  static const String success = "success"; // success with data
  static const String noContent =
      "success"; // success with no data (no content)
  static const String badRequest =
      "bad Request ,try again later"; // failure, API rejected request
  static const String forbidden =
      "forbidden,try again later"; // failure, API rejected request
  static const String unauthorized =
      "user is  unauthorized try again later "; // failure user is not authorised
  static const String internalServerError =
      "some thing went wrong,try again later"; // failure, crash in server side

  static const String connectTimeout = "Time out error,try again later ";
  static const String cancel = "Request was cancelled,try again later ";
  static const String receiveTimeout = "Time out error,try again later";
  static const String sendTimeout = "Time out error,try again later";
  static const String cacheError = "cache error , try again later ";
  static const String noInternetConnection =
      "please check your internet connection ";
  static const String defaultError = "some thing went wrong,try again later";
  static const String notFound = "not found,try again later";
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
