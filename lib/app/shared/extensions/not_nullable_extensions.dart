const zero = 0;
const String emptyString = "";
const List emptyList = [];
const Set emptySet = {};
const Map emptyMap = {};

extension NonNullableInt on int? {
  int orZero() {
    if (this == null) {
      return zero;
    }
    return this!;
  }
}

extension NonNullableDouble on double? {
  double orZero() {
    if (this == null) {
      return zero.toDouble();
    }
    return this!;
  }
}

extension NonNullableString on String? {
  String orEmpty() {
    if (this == null) return emptyString;
    return this!;
  }
}

extension NonNullableBool on bool? {
  bool orFalse() {
    if (this == null) return false;
    return this!;
  }
}

extension NonNullableList on List? {
  List orEmpty() {
    if (this == null) return emptyList;
    return this!;
  }
}

extension NonNullableMap on Map? {
  Map orEmpty() {
    if (this == null) return emptyMap;
    return this!;
  }
}

extension NonNullableSet on Set? {
  Set orEmpty() {
    if (this == null) return emptySet;
    return this!;
  }
}
