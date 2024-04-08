import 'package:hive/hive.dart';
import 'package:wasla/app/services/hive/hive_constants.dart';
import 'package:wasla/domain/entities/auth/passenger_model.dart';

abstract class LocalDataSource {
  Future<PassengerModel> getPassengerModel();

  void setPassengerModel(PassengerModel passengerModel);

  void updatePassengerModelEmail(String email);

  void updatePassengerModelPhone(String phone);
}

class LocalDataSourceImpl extends LocalDataSource {
  Future<Box> _openPassengerBox() async {
    return await Hive.openBox(HiveConstants.passengerBox);
  }

  Future<T> getOpenCloseHiveBox<T>({
    required String boxName,
    required String fieldName,
  }) async {
    Box hiveBox = await Hive.openBox(boxName);
    T model = (hiveBox.get(fieldName) as T);
    hiveBox.close();
    return model;
  }

  void putOpenCloseHiveBox<T>({
    required String boxName,
    required String fieldName,
    required T data,
  }) async {
    Box hiveBox = await Hive.openBox(boxName);
    hiveBox.put(fieldName, data);
    hiveBox.close();
  }

  @override
  Future<PassengerModel> getPassengerModel() async {
    PassengerModel passengerModel = await getOpenCloseHiveBox<PassengerModel>(
      boxName: HiveConstants.passengerBox,
      fieldName: HiveConstants.passengerModel,
    );

    return passengerModel.copyWith();
  }

  @override
  void setPassengerModel(PassengerModel passengerModel) {
    putOpenCloseHiveBox<PassengerModel>(
      boxName: HiveConstants.passengerBox,
      fieldName: HiveConstants.passengerModel,
      data: passengerModel,
    );
  }

  @override
  void updatePassengerModelEmail(String email) async {
    PassengerModel passengerModel = await getPassengerModel();
    setPassengerModel(
      passengerModel.copyWith(
        connections: passengerModel.connections.copyWith(email: email),
      ),
    );
  }

  @override
  void updatePassengerModelPhone(String phone) async {
    PassengerModel passengerModel = await getPassengerModel();
    setPassengerModel(
      passengerModel.copyWith(
        connections: passengerModel.connections.copyWith(phone: phone),
      ),
    );
  }
}
