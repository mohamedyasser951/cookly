import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../error/exceptions.dart';

enum CodeStatus { defaultCode, activation }

String baseUrl = 'https://dummyjson.com';

class ApiBaseHelper {
  final Dio dio;

  ApiBaseHelper({required this.dio}) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Future<dynamic> get({
    required String url,
    String? token,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await dio.get(
        url,
        data: body,
        queryParameters: queryParameters,
      );
      final responseJson = _returnResponse(response);
      return responseJson;
    } on Exception catch (error) {
      if (error is DioException && error.response != null) {
        _returnResponse(error.response);
      }
      throw ServerException(message: handleException(error));
    }
  }

  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> body,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
 
      FormData formData = FormData.fromMap(body);
      final Response response = await dio.post(
        url,
        data: formData,
        queryParameters: queryParameters,
      );
      final responseJson = _returnResponse(response);
      return responseJson;
    } on Exception catch (error) {
      if (error is DioException && error.response != null) {
        _returnResponse(error.response);
      }
      throw ServerException(message: handleException(error));
    }
  }

  Future<dynamic> delete({required String url, String? token}) async {
    try {
  
      final Response response = await dio.delete(url);
      final responseJson = _returnResponse(response);
      return responseJson;
    } on Exception catch (error) {
      if (error is DioException && error.response != null) {
        _returnResponse(error.response);
      }
      throw ServerException(message: handleException(error));
    }
  }

  dynamic _returnResponse(Response? response) {
    if (response == null) {
      throw ServerException(message: 'No internet connection');
    }
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw ServerException(
          message: response.data['message'],
          errorMap: response.data['errors'],
        );
      case 422:
        throw ServerException(
          message: response.data['message'],
          errorMap: response.data['errors'],
        );
      case 403:
        throw EmpolyeeNotWorkingException();
      case 409:
        throw OldVersionException();
      case 451:
        throw TraderAlreadyExistException.fromJson(response.data['data']);
      case 401:
        throw ServerException(message: response.data['message']);
      case 500:
      default:
        throw ServerException(message: 'No internet connection');
    }
  }
}

String handleException(Exception error) {
  if (error.toString().contains('SocketException')) {
    return 'Please check your internet connection and try again';
  } else if (error.runtimeType == DioException) {
    DioException dioError = error as DioException;
    switch (dioError.type) {
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out, please check your internet speed and try again';
      case DioExceptionType.badResponse:
        return dioError.response?.data['message'] ??
            'There was an error responding, please try again later';
      case DioExceptionType.cancel:
        return 'The order has been cancelled, please try again';
      case DioExceptionType.unknown:
      default:
        return 'Something went wrong';
    }
  } else {
    return 'Something went wrong';
  }
}

class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);
  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, 'Invalid Request: ');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([message]) : super(message, 'Unauthorized: ');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input: ');
}
