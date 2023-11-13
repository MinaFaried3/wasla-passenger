// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginFreezed {
  String get phone => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFreezedCopyWith<LoginFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFreezedCopyWith<$Res> {
  factory $LoginFreezedCopyWith(
          LoginFreezed value, $Res Function(LoginFreezed) then) =
      _$LoginFreezedCopyWithImpl<$Res, LoginFreezed>;
  @useResult
  $Res call({String phone, String password});
}

/// @nodoc
class _$LoginFreezedCopyWithImpl<$Res, $Val extends LoginFreezed>
    implements $LoginFreezedCopyWith<$Res> {
  _$LoginFreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginFreezwdImplCopyWith<$Res>
    implements $LoginFreezedCopyWith<$Res> {
  factory _$$LoginFreezwdImplCopyWith(
          _$LoginFreezwdImpl value, $Res Function(_$LoginFreezwdImpl) then) =
      __$$LoginFreezwdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone, String password});
}

/// @nodoc
class __$$LoginFreezwdImplCopyWithImpl<$Res>
    extends _$LoginFreezedCopyWithImpl<$Res, _$LoginFreezwdImpl>
    implements _$$LoginFreezwdImplCopyWith<$Res> {
  __$$LoginFreezwdImplCopyWithImpl(
      _$LoginFreezwdImpl _value, $Res Function(_$LoginFreezwdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? password = null,
  }) {
    return _then(_$LoginFreezwdImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginFreezwdImpl implements _LoginFreezwd {
  _$LoginFreezwdImpl({required this.phone, required this.password});

  @override
  final String phone;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginFreezed(phone: $phone, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFreezwdImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginFreezwdImplCopyWith<_$LoginFreezwdImpl> get copyWith =>
      __$$LoginFreezwdImplCopyWithImpl<_$LoginFreezwdImpl>(this, _$identity);
}

abstract class _LoginFreezwd implements LoginFreezed {
  factory _LoginFreezwd(
      {required final String phone,
      required final String password}) = _$LoginFreezwdImpl;

  @override
  String get phone;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginFreezwdImplCopyWith<_$LoginFreezwdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
