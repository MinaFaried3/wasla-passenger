import 'package:wasla/app/services/hive/hive_constants.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/requests/home/profile/edit_profile_request.dart';

abstract class LocalDataSource {
  Future<PassengerModel> getPassengerModel();

  void setPassengerModel(PassengerModel passengerModel);

  void updatePassengerModelEmail(String email);

  void updatePassengerModelPhone(String phone);

  void updatePassengerModelProfileData(EditProfileRequest editProfile);

  void updateProfileImage(String profileImageUrl);

  Future<String> getPassengerEmail();

  void confirmPassengerEmail();
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
    //todo
    // hiveBox.close();
    return model;
  }

  void putOpenCloseHiveBox<T>({
    required String boxName,
    required String fieldName,
    required T data,
  }) async {
    Box hiveBox = await Hive.openBox(boxName);
    hiveBox.put(fieldName, data);
    PrintManager.print(data, color: ConsoleColor.blue);
    //todo
    // hiveBox.close();
  }

  // @override
  // Future<PassengerModel> getPassengerModel() async {
  //   Box hiveBox = await Hive.openBox(HiveConstants.passengerBox);
  //   PassengerModel model =
  //       (hiveBox.get(HiveConstants.passengerModel) as PassengerModel);
  //   hiveBox.close();
  //   return model.copyWith();
  // }

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

  @override
  Future<String> getPassengerEmail() async {
    PassengerModel passengerModel = await getPassengerModel();
    return passengerModel.copyWith().connections.email;
  }

  @override
  void confirmPassengerEmail() async {
    PassengerModel passengerModel = await getPassengerModel();
    setPassengerModel(
      passengerModel.copyWith(
        connections: passengerModel.connections.copyWith(
          emailConfirmed: true,
        ),
      ),
    );
  }

  @override
  void updatePassengerModelProfileData(EditProfileRequest editProfile) async {
    final passenger = await getPassengerModel();
    setPassengerModel(passenger.copyWith(
      firstName: editProfile.firstname,
      lastName: editProfile.lastname,
      userName: editProfile.username,
      connections: passenger.connections
          .copyWith(email: editProfile.email, phone: editProfile.phone),
      gender: editProfile.gender,
      birthdate: editProfile.birthdate,
    ));
  }

  @override
  void updateProfileImage(String profileImageUrl) async {
    final passenger = await getPassengerModel();
    setPassengerModel(passenger.copyWith(profile: profileImageUrl));
  }
}
