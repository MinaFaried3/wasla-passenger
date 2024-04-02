import 'package:hive_flutter/adapters.dart';
import 'package:wasla/app/services/hive/type_adapter/passenger_type_adapter.dart';

abstract class HiveConstants {
  static const String passengerBox = "passengerBox";
  static const String passengerModel = "passengerModel";

  static void registerHiveTypeAdapters() {
    Hive.registerAdapter(TokensTypeAdapter());
    Hive.registerAdapter(ConnectionsTypeAdapter());
    Hive.registerAdapter(PassengerModelTypeAdapter());
  }
}

abstract class HiveObjectId {
  static const int passengerModelId = 0;
  static const int tokensId = 1;
  static const int connectionsId = 2;
}
