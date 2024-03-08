import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_error.freezed.dart';

@freezed
class CloudError with _$CloudError {
  const factory CloudError.error([String? message]) = _CloudErrorMessage;
  const factory CloudError.serverError() = _ServerError;
  const factory CloudError.noNetworkConnection() = _NoNetworkConnection;
  const factory CloudError.timeOut() = _TimeOut;
}
