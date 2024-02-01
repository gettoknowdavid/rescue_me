// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function() emailInUse,
    required TResult Function() requiresRecentLogin,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function() invalidEmailOrPassword,
    required TResult Function() noGoogleAccount,
    required TResult Function() notVerified,
    required TResult Function() serverError,
    required TResult Function() userNotFound,
    required TResult Function() noNetworkConnection,
    required TResult Function() timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function()? emailInUse,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidEmailOrPassword,
    TResult? Function()? noGoogleAccount,
    TResult? Function()? notVerified,
    TResult? Function()? serverError,
    TResult? Function()? userNotFound,
    TResult? Function()? noNetworkConnection,
    TResult? Function()? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function()? emailInUse,
    TResult Function()? requiresRecentLogin,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function()? invalidEmailOrPassword,
    TResult Function()? noGoogleAccount,
    TResult Function()? notVerified,
    TResult Function()? serverError,
    TResult Function()? userNotFound,
    TResult Function()? noNetworkConnection,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthErrorMessage value) error,
    required TResult Function(_EmailInUse value) emailInUse,
    required TResult Function(_RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidEmailOrPassword value)
        invalidEmailOrPassword,
    required TResult Function(_NoGoogleAccount value) noGoogleAccount,
    required TResult Function(_NotVerified value) notVerified,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NoNetworkConnection value) noNetworkConnection,
    required TResult Function(_TimeOut value) timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthErrorMessage value)? error,
    TResult? Function(_EmailInUse value)? emailInUse,
    TResult? Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult? Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult? Function(_NotVerified value)? notVerified,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult? Function(_TimeOut value)? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthErrorMessage value)? error,
    TResult Function(_EmailInUse value)? emailInUse,
    TResult Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult Function(_NotVerified value)? notVerified,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthErrorCopyWith<$Res> {
  factory $AuthErrorCopyWith(AuthError value, $Res Function(AuthError) then) =
      _$AuthErrorCopyWithImpl<$Res, AuthError>;
}

/// @nodoc
class _$AuthErrorCopyWithImpl<$Res, $Val extends AuthError>
    implements $AuthErrorCopyWith<$Res> {
  _$AuthErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthErrorMessageImplCopyWith<$Res> {
  factory _$$AuthErrorMessageImplCopyWith(_$AuthErrorMessageImpl value,
          $Res Function(_$AuthErrorMessageImpl) then) =
      __$$AuthErrorMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$AuthErrorMessageImplCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$AuthErrorMessageImpl>
    implements _$$AuthErrorMessageImplCopyWith<$Res> {
  __$$AuthErrorMessageImplCopyWithImpl(_$AuthErrorMessageImpl _value,
      $Res Function(_$AuthErrorMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$AuthErrorMessageImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthErrorMessageImpl implements _AuthErrorMessage {
  const _$AuthErrorMessageImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AuthError.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorMessageImplCopyWith<_$AuthErrorMessageImpl> get copyWith =>
      __$$AuthErrorMessageImplCopyWithImpl<_$AuthErrorMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function() emailInUse,
    required TResult Function() requiresRecentLogin,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function() invalidEmailOrPassword,
    required TResult Function() noGoogleAccount,
    required TResult Function() notVerified,
    required TResult Function() serverError,
    required TResult Function() userNotFound,
    required TResult Function() noNetworkConnection,
    required TResult Function() timeOut,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function()? emailInUse,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidEmailOrPassword,
    TResult? Function()? noGoogleAccount,
    TResult? Function()? notVerified,
    TResult? Function()? serverError,
    TResult? Function()? userNotFound,
    TResult? Function()? noNetworkConnection,
    TResult? Function()? timeOut,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function()? emailInUse,
    TResult Function()? requiresRecentLogin,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function()? invalidEmailOrPassword,
    TResult Function()? noGoogleAccount,
    TResult Function()? notVerified,
    TResult Function()? serverError,
    TResult Function()? userNotFound,
    TResult Function()? noNetworkConnection,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthErrorMessage value) error,
    required TResult Function(_EmailInUse value) emailInUse,
    required TResult Function(_RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidEmailOrPassword value)
        invalidEmailOrPassword,
    required TResult Function(_NoGoogleAccount value) noGoogleAccount,
    required TResult Function(_NotVerified value) notVerified,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NoNetworkConnection value) noNetworkConnection,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthErrorMessage value)? error,
    TResult? Function(_EmailInUse value)? emailInUse,
    TResult? Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult? Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult? Function(_NotVerified value)? notVerified,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthErrorMessage value)? error,
    TResult Function(_EmailInUse value)? emailInUse,
    TResult Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult Function(_NotVerified value)? notVerified,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AuthErrorMessage implements AuthError {
  const factory _AuthErrorMessage([final String? message]) =
      _$AuthErrorMessageImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$AuthErrorMessageImplCopyWith<_$AuthErrorMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailInUseImplCopyWith<$Res> {
  factory _$$EmailInUseImplCopyWith(
          _$EmailInUseImpl value, $Res Function(_$EmailInUseImpl) then) =
      __$$EmailInUseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailInUseImplCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$EmailInUseImpl>
    implements _$$EmailInUseImplCopyWith<$Res> {
  __$$EmailInUseImplCopyWithImpl(
      _$EmailInUseImpl _value, $Res Function(_$EmailInUseImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmailInUseImpl implements _EmailInUse {
  const _$EmailInUseImpl();

  @override
  String toString() {
    return 'AuthError.emailInUse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmailInUseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function() emailInUse,
    required TResult Function() requiresRecentLogin,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function() invalidEmailOrPassword,
    required TResult Function() noGoogleAccount,
    required TResult Function() notVerified,
    required TResult Function() serverError,
    required TResult Function() userNotFound,
    required TResult Function() noNetworkConnection,
    required TResult Function() timeOut,
  }) {
    return emailInUse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function()? emailInUse,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidEmailOrPassword,
    TResult? Function()? noGoogleAccount,
    TResult? Function()? notVerified,
    TResult? Function()? serverError,
    TResult? Function()? userNotFound,
    TResult? Function()? noNetworkConnection,
    TResult? Function()? timeOut,
  }) {
    return emailInUse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function()? emailInUse,
    TResult Function()? requiresRecentLogin,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function()? invalidEmailOrPassword,
    TResult Function()? noGoogleAccount,
    TResult Function()? notVerified,
    TResult Function()? serverError,
    TResult Function()? userNotFound,
    TResult Function()? noNetworkConnection,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (emailInUse != null) {
      return emailInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthErrorMessage value) error,
    required TResult Function(_EmailInUse value) emailInUse,
    required TResult Function(_RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidEmailOrPassword value)
        invalidEmailOrPassword,
    required TResult Function(_NoGoogleAccount value) noGoogleAccount,
    required TResult Function(_NotVerified value) notVerified,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NoNetworkConnection value) noNetworkConnection,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return emailInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthErrorMessage value)? error,
    TResult? Function(_EmailInUse value)? emailInUse,
    TResult? Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult? Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult? Function(_NotVerified value)? notVerified,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return emailInUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthErrorMessage value)? error,
    TResult Function(_EmailInUse value)? emailInUse,
    TResult Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult Function(_NotVerified value)? notVerified,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (emailInUse != null) {
      return emailInUse(this);
    }
    return orElse();
  }
}

abstract class _EmailInUse implements AuthError {
  const factory _EmailInUse() = _$EmailInUseImpl;
}

/// @nodoc
abstract class _$$RequiresRecentLoginImplCopyWith<$Res> {
  factory _$$RequiresRecentLoginImplCopyWith(_$RequiresRecentLoginImpl value,
          $Res Function(_$RequiresRecentLoginImpl) then) =
      __$$RequiresRecentLoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequiresRecentLoginImplCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$RequiresRecentLoginImpl>
    implements _$$RequiresRecentLoginImplCopyWith<$Res> {
  __$$RequiresRecentLoginImplCopyWithImpl(_$RequiresRecentLoginImpl _value,
      $Res Function(_$RequiresRecentLoginImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequiresRecentLoginImpl implements _RequiresRecentLogin {
  const _$RequiresRecentLoginImpl();

  @override
  String toString() {
    return 'AuthError.requiresRecentLogin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequiresRecentLoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function() emailInUse,
    required TResult Function() requiresRecentLogin,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function() invalidEmailOrPassword,
    required TResult Function() noGoogleAccount,
    required TResult Function() notVerified,
    required TResult Function() serverError,
    required TResult Function() userNotFound,
    required TResult Function() noNetworkConnection,
    required TResult Function() timeOut,
  }) {
    return requiresRecentLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function()? emailInUse,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidEmailOrPassword,
    TResult? Function()? noGoogleAccount,
    TResult? Function()? notVerified,
    TResult? Function()? serverError,
    TResult? Function()? userNotFound,
    TResult? Function()? noNetworkConnection,
    TResult? Function()? timeOut,
  }) {
    return requiresRecentLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function()? emailInUse,
    TResult Function()? requiresRecentLogin,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function()? invalidEmailOrPassword,
    TResult Function()? noGoogleAccount,
    TResult Function()? notVerified,
    TResult Function()? serverError,
    TResult Function()? userNotFound,
    TResult Function()? noNetworkConnection,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (requiresRecentLogin != null) {
      return requiresRecentLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthErrorMessage value) error,
    required TResult Function(_EmailInUse value) emailInUse,
    required TResult Function(_RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidEmailOrPassword value)
        invalidEmailOrPassword,
    required TResult Function(_NoGoogleAccount value) noGoogleAccount,
    required TResult Function(_NotVerified value) notVerified,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NoNetworkConnection value) noNetworkConnection,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return requiresRecentLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthErrorMessage value)? error,
    TResult? Function(_EmailInUse value)? emailInUse,
    TResult? Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult? Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult? Function(_NotVerified value)? notVerified,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return requiresRecentLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthErrorMessage value)? error,
    TResult Function(_EmailInUse value)? emailInUse,
    TResult Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult Function(_NotVerified value)? notVerified,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (requiresRecentLogin != null) {
      return requiresRecentLogin(this);
    }
    return orElse();
  }
}

abstract class _RequiresRecentLogin implements AuthError {
  const factory _RequiresRecentLogin() = _$RequiresRecentLoginImpl;
}

/// @nodoc
abstract class _$$InvalidEmailImplCopyWith<$Res> {
  factory _$$InvalidEmailImplCopyWith(
          _$InvalidEmailImpl value, $Res Function(_$InvalidEmailImpl) then) =
      __$$InvalidEmailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidEmailImplCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$InvalidEmailImpl>
    implements _$$InvalidEmailImplCopyWith<$Res> {
  __$$InvalidEmailImplCopyWithImpl(
      _$InvalidEmailImpl _value, $Res Function(_$InvalidEmailImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidEmailImpl implements _InvalidEmail {
  const _$InvalidEmailImpl();

  @override
  String toString() {
    return 'AuthError.invalidEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidEmailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function() emailInUse,
    required TResult Function() requiresRecentLogin,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function() invalidEmailOrPassword,
    required TResult Function() noGoogleAccount,
    required TResult Function() notVerified,
    required TResult Function() serverError,
    required TResult Function() userNotFound,
    required TResult Function() noNetworkConnection,
    required TResult Function() timeOut,
  }) {
    return invalidEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function()? emailInUse,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidEmailOrPassword,
    TResult? Function()? noGoogleAccount,
    TResult? Function()? notVerified,
    TResult? Function()? serverError,
    TResult? Function()? userNotFound,
    TResult? Function()? noNetworkConnection,
    TResult? Function()? timeOut,
  }) {
    return invalidEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function()? emailInUse,
    TResult Function()? requiresRecentLogin,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function()? invalidEmailOrPassword,
    TResult Function()? noGoogleAccount,
    TResult Function()? notVerified,
    TResult Function()? serverError,
    TResult Function()? userNotFound,
    TResult Function()? noNetworkConnection,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthErrorMessage value) error,
    required TResult Function(_EmailInUse value) emailInUse,
    required TResult Function(_RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidEmailOrPassword value)
        invalidEmailOrPassword,
    required TResult Function(_NoGoogleAccount value) noGoogleAccount,
    required TResult Function(_NotVerified value) notVerified,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NoNetworkConnection value) noNetworkConnection,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthErrorMessage value)? error,
    TResult? Function(_EmailInUse value)? emailInUse,
    TResult? Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult? Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult? Function(_NotVerified value)? notVerified,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthErrorMessage value)? error,
    TResult Function(_EmailInUse value)? emailInUse,
    TResult Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult Function(_NotVerified value)? notVerified,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class _InvalidEmail implements AuthError {
  const factory _InvalidEmail() = _$InvalidEmailImpl;
}

/// @nodoc
abstract class _$$InvalidPasswordImplCopyWith<$Res> {
  factory _$$InvalidPasswordImplCopyWith(_$InvalidPasswordImpl value,
          $Res Function(_$InvalidPasswordImpl) then) =
      __$$InvalidPasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidPasswordImplCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$InvalidPasswordImpl>
    implements _$$InvalidPasswordImplCopyWith<$Res> {
  __$$InvalidPasswordImplCopyWithImpl(
      _$InvalidPasswordImpl _value, $Res Function(_$InvalidPasswordImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidPasswordImpl implements _InvalidPassword {
  const _$InvalidPasswordImpl();

  @override
  String toString() {
    return 'AuthError.invalidPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidPasswordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function() emailInUse,
    required TResult Function() requiresRecentLogin,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function() invalidEmailOrPassword,
    required TResult Function() noGoogleAccount,
    required TResult Function() notVerified,
    required TResult Function() serverError,
    required TResult Function() userNotFound,
    required TResult Function() noNetworkConnection,
    required TResult Function() timeOut,
  }) {
    return invalidPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function()? emailInUse,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidEmailOrPassword,
    TResult? Function()? noGoogleAccount,
    TResult? Function()? notVerified,
    TResult? Function()? serverError,
    TResult? Function()? userNotFound,
    TResult? Function()? noNetworkConnection,
    TResult? Function()? timeOut,
  }) {
    return invalidPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function()? emailInUse,
    TResult Function()? requiresRecentLogin,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function()? invalidEmailOrPassword,
    TResult Function()? noGoogleAccount,
    TResult Function()? notVerified,
    TResult Function()? serverError,
    TResult Function()? userNotFound,
    TResult Function()? noNetworkConnection,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthErrorMessage value) error,
    required TResult Function(_EmailInUse value) emailInUse,
    required TResult Function(_RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidEmailOrPassword value)
        invalidEmailOrPassword,
    required TResult Function(_NoGoogleAccount value) noGoogleAccount,
    required TResult Function(_NotVerified value) notVerified,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NoNetworkConnection value) noNetworkConnection,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return invalidPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthErrorMessage value)? error,
    TResult? Function(_EmailInUse value)? emailInUse,
    TResult? Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult? Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult? Function(_NotVerified value)? notVerified,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return invalidPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthErrorMessage value)? error,
    TResult Function(_EmailInUse value)? emailInUse,
    TResult Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult Function(_NotVerified value)? notVerified,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(this);
    }
    return orElse();
  }
}

abstract class _InvalidPassword implements AuthError {
  const factory _InvalidPassword() = _$InvalidPasswordImpl;
}

/// @nodoc
abstract class _$$InvalidEmailOrPasswordImplCopyWith<$Res> {
  factory _$$InvalidEmailOrPasswordImplCopyWith(
          _$InvalidEmailOrPasswordImpl value,
          $Res Function(_$InvalidEmailOrPasswordImpl) then) =
      __$$InvalidEmailOrPasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidEmailOrPasswordImplCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$InvalidEmailOrPasswordImpl>
    implements _$$InvalidEmailOrPasswordImplCopyWith<$Res> {
  __$$InvalidEmailOrPasswordImplCopyWithImpl(
      _$InvalidEmailOrPasswordImpl _value,
      $Res Function(_$InvalidEmailOrPasswordImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidEmailOrPasswordImpl implements _InvalidEmailOrPassword {
  const _$InvalidEmailOrPasswordImpl();

  @override
  String toString() {
    return 'AuthError.invalidEmailOrPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmailOrPasswordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function() emailInUse,
    required TResult Function() requiresRecentLogin,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function() invalidEmailOrPassword,
    required TResult Function() noGoogleAccount,
    required TResult Function() notVerified,
    required TResult Function() serverError,
    required TResult Function() userNotFound,
    required TResult Function() noNetworkConnection,
    required TResult Function() timeOut,
  }) {
    return invalidEmailOrPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function()? emailInUse,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidEmailOrPassword,
    TResult? Function()? noGoogleAccount,
    TResult? Function()? notVerified,
    TResult? Function()? serverError,
    TResult? Function()? userNotFound,
    TResult? Function()? noNetworkConnection,
    TResult? Function()? timeOut,
  }) {
    return invalidEmailOrPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function()? emailInUse,
    TResult Function()? requiresRecentLogin,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function()? invalidEmailOrPassword,
    TResult Function()? noGoogleAccount,
    TResult Function()? notVerified,
    TResult Function()? serverError,
    TResult Function()? userNotFound,
    TResult Function()? noNetworkConnection,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (invalidEmailOrPassword != null) {
      return invalidEmailOrPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthErrorMessage value) error,
    required TResult Function(_EmailInUse value) emailInUse,
    required TResult Function(_RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidEmailOrPassword value)
        invalidEmailOrPassword,
    required TResult Function(_NoGoogleAccount value) noGoogleAccount,
    required TResult Function(_NotVerified value) notVerified,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NoNetworkConnection value) noNetworkConnection,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return invalidEmailOrPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthErrorMessage value)? error,
    TResult? Function(_EmailInUse value)? emailInUse,
    TResult? Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult? Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult? Function(_NotVerified value)? notVerified,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return invalidEmailOrPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthErrorMessage value)? error,
    TResult Function(_EmailInUse value)? emailInUse,
    TResult Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult Function(_NotVerified value)? notVerified,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (invalidEmailOrPassword != null) {
      return invalidEmailOrPassword(this);
    }
    return orElse();
  }
}

abstract class _InvalidEmailOrPassword implements AuthError {
  const factory _InvalidEmailOrPassword() = _$InvalidEmailOrPasswordImpl;
}

/// @nodoc
abstract class _$$NoGoogleAccountImplCopyWith<$Res> {
  factory _$$NoGoogleAccountImplCopyWith(_$NoGoogleAccountImpl value,
          $Res Function(_$NoGoogleAccountImpl) then) =
      __$$NoGoogleAccountImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoGoogleAccountImplCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$NoGoogleAccountImpl>
    implements _$$NoGoogleAccountImplCopyWith<$Res> {
  __$$NoGoogleAccountImplCopyWithImpl(
      _$NoGoogleAccountImpl _value, $Res Function(_$NoGoogleAccountImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoGoogleAccountImpl implements _NoGoogleAccount {
  const _$NoGoogleAccountImpl();

  @override
  String toString() {
    return 'AuthError.noGoogleAccount()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoGoogleAccountImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function() emailInUse,
    required TResult Function() requiresRecentLogin,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function() invalidEmailOrPassword,
    required TResult Function() noGoogleAccount,
    required TResult Function() notVerified,
    required TResult Function() serverError,
    required TResult Function() userNotFound,
    required TResult Function() noNetworkConnection,
    required TResult Function() timeOut,
  }) {
    return noGoogleAccount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function()? emailInUse,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidEmailOrPassword,
    TResult? Function()? noGoogleAccount,
    TResult? Function()? notVerified,
    TResult? Function()? serverError,
    TResult? Function()? userNotFound,
    TResult? Function()? noNetworkConnection,
    TResult? Function()? timeOut,
  }) {
    return noGoogleAccount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function()? emailInUse,
    TResult Function()? requiresRecentLogin,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function()? invalidEmailOrPassword,
    TResult Function()? noGoogleAccount,
    TResult Function()? notVerified,
    TResult Function()? serverError,
    TResult Function()? userNotFound,
    TResult Function()? noNetworkConnection,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (noGoogleAccount != null) {
      return noGoogleAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthErrorMessage value) error,
    required TResult Function(_EmailInUse value) emailInUse,
    required TResult Function(_RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidEmailOrPassword value)
        invalidEmailOrPassword,
    required TResult Function(_NoGoogleAccount value) noGoogleAccount,
    required TResult Function(_NotVerified value) notVerified,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NoNetworkConnection value) noNetworkConnection,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return noGoogleAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthErrorMessage value)? error,
    TResult? Function(_EmailInUse value)? emailInUse,
    TResult? Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult? Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult? Function(_NotVerified value)? notVerified,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return noGoogleAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthErrorMessage value)? error,
    TResult Function(_EmailInUse value)? emailInUse,
    TResult Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult Function(_NotVerified value)? notVerified,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (noGoogleAccount != null) {
      return noGoogleAccount(this);
    }
    return orElse();
  }
}

abstract class _NoGoogleAccount implements AuthError {
  const factory _NoGoogleAccount() = _$NoGoogleAccountImpl;
}

/// @nodoc
abstract class _$$NotVerifiedImplCopyWith<$Res> {
  factory _$$NotVerifiedImplCopyWith(
          _$NotVerifiedImpl value, $Res Function(_$NotVerifiedImpl) then) =
      __$$NotVerifiedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotVerifiedImplCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$NotVerifiedImpl>
    implements _$$NotVerifiedImplCopyWith<$Res> {
  __$$NotVerifiedImplCopyWithImpl(
      _$NotVerifiedImpl _value, $Res Function(_$NotVerifiedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotVerifiedImpl implements _NotVerified {
  const _$NotVerifiedImpl();

  @override
  String toString() {
    return 'AuthError.notVerified()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotVerifiedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function() emailInUse,
    required TResult Function() requiresRecentLogin,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function() invalidEmailOrPassword,
    required TResult Function() noGoogleAccount,
    required TResult Function() notVerified,
    required TResult Function() serverError,
    required TResult Function() userNotFound,
    required TResult Function() noNetworkConnection,
    required TResult Function() timeOut,
  }) {
    return notVerified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function()? emailInUse,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidEmailOrPassword,
    TResult? Function()? noGoogleAccount,
    TResult? Function()? notVerified,
    TResult? Function()? serverError,
    TResult? Function()? userNotFound,
    TResult? Function()? noNetworkConnection,
    TResult? Function()? timeOut,
  }) {
    return notVerified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function()? emailInUse,
    TResult Function()? requiresRecentLogin,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function()? invalidEmailOrPassword,
    TResult Function()? noGoogleAccount,
    TResult Function()? notVerified,
    TResult Function()? serverError,
    TResult Function()? userNotFound,
    TResult Function()? noNetworkConnection,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (notVerified != null) {
      return notVerified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthErrorMessage value) error,
    required TResult Function(_EmailInUse value) emailInUse,
    required TResult Function(_RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidEmailOrPassword value)
        invalidEmailOrPassword,
    required TResult Function(_NoGoogleAccount value) noGoogleAccount,
    required TResult Function(_NotVerified value) notVerified,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NoNetworkConnection value) noNetworkConnection,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return notVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthErrorMessage value)? error,
    TResult? Function(_EmailInUse value)? emailInUse,
    TResult? Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult? Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult? Function(_NotVerified value)? notVerified,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return notVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthErrorMessage value)? error,
    TResult Function(_EmailInUse value)? emailInUse,
    TResult Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult Function(_NotVerified value)? notVerified,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (notVerified != null) {
      return notVerified(this);
    }
    return orElse();
  }
}

abstract class _NotVerified implements AuthError {
  const factory _NotVerified() = _$NotVerifiedImpl;
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServerErrorImpl implements _ServerError {
  const _$ServerErrorImpl();

  @override
  String toString() {
    return 'AuthError.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function() emailInUse,
    required TResult Function() requiresRecentLogin,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function() invalidEmailOrPassword,
    required TResult Function() noGoogleAccount,
    required TResult Function() notVerified,
    required TResult Function() serverError,
    required TResult Function() userNotFound,
    required TResult Function() noNetworkConnection,
    required TResult Function() timeOut,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function()? emailInUse,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidEmailOrPassword,
    TResult? Function()? noGoogleAccount,
    TResult? Function()? notVerified,
    TResult? Function()? serverError,
    TResult? Function()? userNotFound,
    TResult? Function()? noNetworkConnection,
    TResult? Function()? timeOut,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function()? emailInUse,
    TResult Function()? requiresRecentLogin,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function()? invalidEmailOrPassword,
    TResult Function()? noGoogleAccount,
    TResult Function()? notVerified,
    TResult Function()? serverError,
    TResult Function()? userNotFound,
    TResult Function()? noNetworkConnection,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthErrorMessage value) error,
    required TResult Function(_EmailInUse value) emailInUse,
    required TResult Function(_RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidEmailOrPassword value)
        invalidEmailOrPassword,
    required TResult Function(_NoGoogleAccount value) noGoogleAccount,
    required TResult Function(_NotVerified value) notVerified,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NoNetworkConnection value) noNetworkConnection,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthErrorMessage value)? error,
    TResult? Function(_EmailInUse value)? emailInUse,
    TResult? Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult? Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult? Function(_NotVerified value)? notVerified,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthErrorMessage value)? error,
    TResult Function(_EmailInUse value)? emailInUse,
    TResult Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult Function(_NotVerified value)? notVerified,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements AuthError {
  const factory _ServerError() = _$ServerErrorImpl;
}

/// @nodoc
abstract class _$$UserNotFoundImplCopyWith<$Res> {
  factory _$$UserNotFoundImplCopyWith(
          _$UserNotFoundImpl value, $Res Function(_$UserNotFoundImpl) then) =
      __$$UserNotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserNotFoundImplCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$UserNotFoundImpl>
    implements _$$UserNotFoundImplCopyWith<$Res> {
  __$$UserNotFoundImplCopyWithImpl(
      _$UserNotFoundImpl _value, $Res Function(_$UserNotFoundImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserNotFoundImpl implements _UserNotFound {
  const _$UserNotFoundImpl();

  @override
  String toString() {
    return 'AuthError.userNotFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserNotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function() emailInUse,
    required TResult Function() requiresRecentLogin,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function() invalidEmailOrPassword,
    required TResult Function() noGoogleAccount,
    required TResult Function() notVerified,
    required TResult Function() serverError,
    required TResult Function() userNotFound,
    required TResult Function() noNetworkConnection,
    required TResult Function() timeOut,
  }) {
    return userNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function()? emailInUse,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidEmailOrPassword,
    TResult? Function()? noGoogleAccount,
    TResult? Function()? notVerified,
    TResult? Function()? serverError,
    TResult? Function()? userNotFound,
    TResult? Function()? noNetworkConnection,
    TResult? Function()? timeOut,
  }) {
    return userNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function()? emailInUse,
    TResult Function()? requiresRecentLogin,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function()? invalidEmailOrPassword,
    TResult Function()? noGoogleAccount,
    TResult Function()? notVerified,
    TResult Function()? serverError,
    TResult Function()? userNotFound,
    TResult Function()? noNetworkConnection,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthErrorMessage value) error,
    required TResult Function(_EmailInUse value) emailInUse,
    required TResult Function(_RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidEmailOrPassword value)
        invalidEmailOrPassword,
    required TResult Function(_NoGoogleAccount value) noGoogleAccount,
    required TResult Function(_NotVerified value) notVerified,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NoNetworkConnection value) noNetworkConnection,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthErrorMessage value)? error,
    TResult? Function(_EmailInUse value)? emailInUse,
    TResult? Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult? Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult? Function(_NotVerified value)? notVerified,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return userNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthErrorMessage value)? error,
    TResult Function(_EmailInUse value)? emailInUse,
    TResult Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult Function(_NotVerified value)? notVerified,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class _UserNotFound implements AuthError {
  const factory _UserNotFound() = _$UserNotFoundImpl;
}

/// @nodoc
abstract class _$$NoNetworkConnectionImplCopyWith<$Res> {
  factory _$$NoNetworkConnectionImplCopyWith(_$NoNetworkConnectionImpl value,
          $Res Function(_$NoNetworkConnectionImpl) then) =
      __$$NoNetworkConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoNetworkConnectionImplCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$NoNetworkConnectionImpl>
    implements _$$NoNetworkConnectionImplCopyWith<$Res> {
  __$$NoNetworkConnectionImplCopyWithImpl(_$NoNetworkConnectionImpl _value,
      $Res Function(_$NoNetworkConnectionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoNetworkConnectionImpl implements _NoNetworkConnection {
  const _$NoNetworkConnectionImpl();

  @override
  String toString() {
    return 'AuthError.noNetworkConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoNetworkConnectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function() emailInUse,
    required TResult Function() requiresRecentLogin,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function() invalidEmailOrPassword,
    required TResult Function() noGoogleAccount,
    required TResult Function() notVerified,
    required TResult Function() serverError,
    required TResult Function() userNotFound,
    required TResult Function() noNetworkConnection,
    required TResult Function() timeOut,
  }) {
    return noNetworkConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function()? emailInUse,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidEmailOrPassword,
    TResult? Function()? noGoogleAccount,
    TResult? Function()? notVerified,
    TResult? Function()? serverError,
    TResult? Function()? userNotFound,
    TResult? Function()? noNetworkConnection,
    TResult? Function()? timeOut,
  }) {
    return noNetworkConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function()? emailInUse,
    TResult Function()? requiresRecentLogin,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function()? invalidEmailOrPassword,
    TResult Function()? noGoogleAccount,
    TResult Function()? notVerified,
    TResult Function()? serverError,
    TResult Function()? userNotFound,
    TResult Function()? noNetworkConnection,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (noNetworkConnection != null) {
      return noNetworkConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthErrorMessage value) error,
    required TResult Function(_EmailInUse value) emailInUse,
    required TResult Function(_RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidEmailOrPassword value)
        invalidEmailOrPassword,
    required TResult Function(_NoGoogleAccount value) noGoogleAccount,
    required TResult Function(_NotVerified value) notVerified,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NoNetworkConnection value) noNetworkConnection,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return noNetworkConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthErrorMessage value)? error,
    TResult? Function(_EmailInUse value)? emailInUse,
    TResult? Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult? Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult? Function(_NotVerified value)? notVerified,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return noNetworkConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthErrorMessage value)? error,
    TResult Function(_EmailInUse value)? emailInUse,
    TResult Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult Function(_NotVerified value)? notVerified,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (noNetworkConnection != null) {
      return noNetworkConnection(this);
    }
    return orElse();
  }
}

abstract class _NoNetworkConnection implements AuthError {
  const factory _NoNetworkConnection() = _$NoNetworkConnectionImpl;
}

/// @nodoc
abstract class _$$TimeOutImplCopyWith<$Res> {
  factory _$$TimeOutImplCopyWith(
          _$TimeOutImpl value, $Res Function(_$TimeOutImpl) then) =
      __$$TimeOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimeOutImplCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$TimeOutImpl>
    implements _$$TimeOutImplCopyWith<$Res> {
  __$$TimeOutImplCopyWithImpl(
      _$TimeOutImpl _value, $Res Function(_$TimeOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimeOutImpl implements _TimeOut {
  const _$TimeOutImpl();

  @override
  String toString() {
    return 'AuthError.timeOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimeOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function() emailInUse,
    required TResult Function() requiresRecentLogin,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function() invalidEmailOrPassword,
    required TResult Function() noGoogleAccount,
    required TResult Function() notVerified,
    required TResult Function() serverError,
    required TResult Function() userNotFound,
    required TResult Function() noNetworkConnection,
    required TResult Function() timeOut,
  }) {
    return timeOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function()? emailInUse,
    TResult? Function()? requiresRecentLogin,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidEmailOrPassword,
    TResult? Function()? noGoogleAccount,
    TResult? Function()? notVerified,
    TResult? Function()? serverError,
    TResult? Function()? userNotFound,
    TResult? Function()? noNetworkConnection,
    TResult? Function()? timeOut,
  }) {
    return timeOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function()? emailInUse,
    TResult Function()? requiresRecentLogin,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function()? invalidEmailOrPassword,
    TResult Function()? noGoogleAccount,
    TResult Function()? notVerified,
    TResult Function()? serverError,
    TResult Function()? userNotFound,
    TResult Function()? noNetworkConnection,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthErrorMessage value) error,
    required TResult Function(_EmailInUse value) emailInUse,
    required TResult Function(_RequiresRecentLogin value) requiresRecentLogin,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidEmailOrPassword value)
        invalidEmailOrPassword,
    required TResult Function(_NoGoogleAccount value) noGoogleAccount,
    required TResult Function(_NotVerified value) notVerified,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NoNetworkConnection value) noNetworkConnection,
    required TResult Function(_TimeOut value) timeOut,
  }) {
    return timeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthErrorMessage value)? error,
    TResult? Function(_EmailInUse value)? emailInUse,
    TResult? Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult? Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult? Function(_NotVerified value)? notVerified,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult? Function(_TimeOut value)? timeOut,
  }) {
    return timeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthErrorMessage value)? error,
    TResult Function(_EmailInUse value)? emailInUse,
    TResult Function(_RequiresRecentLogin value)? requiresRecentLogin,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidEmailOrPassword value)? invalidEmailOrPassword,
    TResult Function(_NoGoogleAccount value)? noGoogleAccount,
    TResult Function(_NotVerified value)? notVerified,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NoNetworkConnection value)? noNetworkConnection,
    TResult Function(_TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut(this);
    }
    return orElse();
  }
}

abstract class _TimeOut implements AuthError {
  const factory _TimeOut() = _$TimeOutImpl;
}
