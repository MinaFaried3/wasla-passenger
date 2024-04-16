// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  HomeContentItem get homeContentItem => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeContentItem homeContentItem) initial,
    required TResult Function(HomeContentItem homeContentItem)
        changeBodyContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeContentItem homeContentItem)? initial,
    TResult? Function(HomeContentItem homeContentItem)? changeBodyContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeContentItem homeContentItem)? initial,
    TResult Function(HomeContentItem homeContentItem)? changeBodyContent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeBodyContentState value) changeBodyContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeBodyContentState value)? changeBodyContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeBodyContentState value)? changeBodyContent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({HomeContentItem homeContentItem});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeContentItem = null,
  }) {
    return _then(_value.copyWith(
      homeContentItem: null == homeContentItem
          ? _value.homeContentItem
          : homeContentItem // ignore: cast_nullable_to_non_nullable
              as HomeContentItem,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HomeContentItem homeContentItem});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeContentItem = null,
  }) {
    return _then(_$InitialImpl(
      null == homeContentItem
          ? _value.homeContentItem
          : homeContentItem // ignore: cast_nullable_to_non_nullable
              as HomeContentItem,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.homeContentItem);

  @override
  final HomeContentItem homeContentItem;

  @override
  String toString() {
    return 'HomeState.initial(homeContentItem: $homeContentItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.homeContentItem, homeContentItem) ||
                other.homeContentItem == homeContentItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, homeContentItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeContentItem homeContentItem) initial,
    required TResult Function(HomeContentItem homeContentItem)
        changeBodyContent,
  }) {
    return initial(homeContentItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeContentItem homeContentItem)? initial,
    TResult? Function(HomeContentItem homeContentItem)? changeBodyContent,
  }) {
    return initial?.call(homeContentItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeContentItem homeContentItem)? initial,
    TResult Function(HomeContentItem homeContentItem)? changeBodyContent,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(homeContentItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeBodyContentState value) changeBodyContent,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeBodyContentState value)? changeBodyContent,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeBodyContentState value)? changeBodyContent,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial(final HomeContentItem homeContentItem) = _$InitialImpl;

  @override
  HomeContentItem get homeContentItem;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeBodyContentStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$ChangeBodyContentStateImplCopyWith(
          _$ChangeBodyContentStateImpl value,
          $Res Function(_$ChangeBodyContentStateImpl) then) =
      __$$ChangeBodyContentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HomeContentItem homeContentItem});
}

/// @nodoc
class __$$ChangeBodyContentStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ChangeBodyContentStateImpl>
    implements _$$ChangeBodyContentStateImplCopyWith<$Res> {
  __$$ChangeBodyContentStateImplCopyWithImpl(
      _$ChangeBodyContentStateImpl _value,
      $Res Function(_$ChangeBodyContentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeContentItem = null,
  }) {
    return _then(_$ChangeBodyContentStateImpl(
      null == homeContentItem
          ? _value.homeContentItem
          : homeContentItem // ignore: cast_nullable_to_non_nullable
              as HomeContentItem,
    ));
  }
}

/// @nodoc

class _$ChangeBodyContentStateImpl implements _ChangeBodyContentState {
  const _$ChangeBodyContentStateImpl(this.homeContentItem);

  @override
  final HomeContentItem homeContentItem;

  @override
  String toString() {
    return 'HomeState.changeBodyContent(homeContentItem: $homeContentItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeBodyContentStateImpl &&
            (identical(other.homeContentItem, homeContentItem) ||
                other.homeContentItem == homeContentItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, homeContentItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeBodyContentStateImplCopyWith<_$ChangeBodyContentStateImpl>
      get copyWith => __$$ChangeBodyContentStateImplCopyWithImpl<
          _$ChangeBodyContentStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeContentItem homeContentItem) initial,
    required TResult Function(HomeContentItem homeContentItem)
        changeBodyContent,
  }) {
    return changeBodyContent(homeContentItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeContentItem homeContentItem)? initial,
    TResult? Function(HomeContentItem homeContentItem)? changeBodyContent,
  }) {
    return changeBodyContent?.call(homeContentItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeContentItem homeContentItem)? initial,
    TResult Function(HomeContentItem homeContentItem)? changeBodyContent,
    required TResult orElse(),
  }) {
    if (changeBodyContent != null) {
      return changeBodyContent(homeContentItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeBodyContentState value) changeBodyContent,
  }) {
    return changeBodyContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeBodyContentState value)? changeBodyContent,
  }) {
    return changeBodyContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeBodyContentState value)? changeBodyContent,
    required TResult orElse(),
  }) {
    if (changeBodyContent != null) {
      return changeBodyContent(this);
    }
    return orElse();
  }
}

abstract class _ChangeBodyContentState implements HomeState {
  const factory _ChangeBodyContentState(final HomeContentItem homeContentItem) =
      _$ChangeBodyContentStateImpl;

  @override
  HomeContentItem get homeContentItem;
  @override
  @JsonKey(ignore: true)
  _$$ChangeBodyContentStateImplCopyWith<_$ChangeBodyContentStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
