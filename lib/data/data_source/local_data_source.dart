import 'package:hive/hive.dart';
import 'package:wasla/app/services/hive/hive_constants.dart';
import 'package:wasla/domain/entities/auth/passenger_model.dart';

abstract class LocalDataSource {
  Future<PassengerModel> getPassengerModel();

  void setPassengerModel(PassengerModel passengerModel);
}

class LocalDataSourceImpl extends LocalDataSource {
  @override
  Future<PassengerModel> getPassengerModel() async {
    Box passengerBox = await Hive.openBox(HiveConstants.passengerBox);
    PassengerModel passengerModel =
        (passengerBox.get(HiveConstants.passengerModel) as PassengerModel)
            .copyWith();
    passengerBox.close();
    return passengerModel;
  }

  @override
  void setPassengerModel(PassengerModel passengerModel) async {
    Box passengerBox = await Hive.openBox(HiveConstants.passengerBox);
    passengerBox.put(HiveConstants.passengerModel, passengerModel);
    passengerBox.close();
  }
}
