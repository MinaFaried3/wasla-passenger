import 'package:wasla/app/services/hive/hive_constants.dart';
import 'package:wasla/app/shared/common/common_libs.dart';

class TokensTypeAdapter extends TypeAdapter<Tokens> {
  @override
  Tokens read(BinaryReader reader) {
    return Tokens(
      token: reader.readString(),
      tokenExpiryDate: reader.readString(),
      refreshToken: reader.readString(),
      refTokenExpiryDate: reader.readString(),
    );
  }

  @override
  int get typeId => HiveObjectId.tokensId;

  @override
  void write(BinaryWriter writer, Tokens obj) {
    writer.writeString(obj.token);
    writer.writeString(obj.tokenExpiryDate);
    writer.writeString(obj.refreshToken);
    writer.writeString(obj.refTokenExpiryDate);
  }
}

class ConnectionsTypeAdapter extends TypeAdapter<Connections> {
  @override
  Connections read(BinaryReader reader) {
    return Connections(
      email: reader.readString(),
      phone: reader.readString(),
      emailConfirmed: reader.readBool(),
      phoneConfirmed: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Connections obj) {
    writer.writeString(obj.email);
    writer.writeString(obj.phone);
    writer.writeBool(obj.emailConfirmed);
    writer.writeBool(obj.phoneConfirmed);
  }

  @override
  int get typeId => HiveObjectId.connectionsId;
}

class PassengerModelTypeAdapter extends TypeAdapter<PassengerModel> {
  @override
  PassengerModel read(BinaryReader reader) {
    return PassengerModel(
      points: reader.readInt(),
      firstName: reader.readString(),
      lastName: reader.readString(),
      profile: reader.readString(),
      userName: reader.readString(),
      isAuthenticated: reader.readBool(),
      connections: reader.read() as Connections,
      tokens: reader.read() as Tokens,
      role: reader.readString(),
    );
  }

  @override
  int get typeId => HiveObjectId.passengerModelId;

  @override
  void write(BinaryWriter writer, PassengerModel obj) {
    writer.writeInt(obj.points);
    writer.writeString(obj.firstName);
    writer.writeString(obj.lastName);
    writer.writeString(obj.profile);
    writer.writeString(obj.userName);
    writer.writeBool(obj.isAuthenticated);
    writer.write(obj.connections);
    writer.write(obj.tokens);
    writer.writeString(obj.role);
  }
}
