import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_exception.freezed.dart';

@freezed
class ProductException with _$ProductException {
  const factory ProductException.message(String message) = _Message;
  const factory ProductException.serverError() = _ServerError;
  const factory ProductException.unknownError() = _UnknownError;
  const factory ProductException.timeOutError() = _TimeOutError;
  const factory ProductException.networkError() = _NetworkError;
}