import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';

final class PassengerModel extends Equatable {
  final int points;
  final String firstName;
  final String lastName;
  final String profile;
  final String userName;
  final bool isAuthenticated;
  final Connections connections;
  final Tokens tokens;
  final String role;

  const PassengerModel({
    required this.points,
    required this.firstName,
    required this.lastName,
    required this.profile,
    required this.userName,
    required this.role,
    required this.isAuthenticated,
    required this.connections,
    required this.tokens,
  });

  factory PassengerModel.empty() => PassengerModel(
      points: AppConstants.zero,
      firstName: AppConstants.emptyString,
      lastName: AppConstants.emptyString,
      profile: AppConstants.emptyString,
      userName: AppConstants.emptyString,
      isAuthenticated: false,
      connections: Connections.empty(),
      tokens: Tokens.empty(),
      role: AppConstants.emptyString);

  @override
  List<Object> get props => [
        points,
        firstName,
        lastName,
        profile,
        userName,
        isAuthenticated,
        connections,
        tokens,
        role,
      ];

  @override
  String toString() {
    return 'PassengerModel{points: $points, firstName: $firstName, lastName: $lastName, profile: $profile, userName: $userName, isAuthenticated: $isAuthenticated, connections: $connections, tokens: $tokens, role: $role}';
  }
}

final class Connections extends Equatable {
  final String email;
  final String phone;

  const Connections({required this.email, required this.phone});

  factory Connections.empty() => const Connections(
        email: AppConstants.emptyString,
        phone: AppConstants.emptyString,
      );

  @override
  List<Object> get props => [email, phone];

  @override
  String toString() {
    return 'Connections{email: $email, phone: $phone}';
  }
}

final class Tokens extends Equatable {
  //todo convert to date time

  final String token;
  final String tokenExpiryDate;
  final String refreshToken;
  final String refTokenExpiryDate;

  const Tokens(
      {required this.token,
      required this.tokenExpiryDate,
      required this.refreshToken,
      required this.refTokenExpiryDate});

  factory Tokens.empty() => const Tokens(
        token: AppConstants.emptyString,
        tokenExpiryDate: AppConstants.emptyString,
        refreshToken: AppConstants.emptyString,
        refTokenExpiryDate: AppConstants.emptyString,
      );

  @override
  List<Object> get props => [
        token,
        tokenExpiryDate,
        refreshToken,
        refTokenExpiryDate,
      ];

  @override
  String toString() {
    return 'Tokens{token: $token, tokenExpiryDate: $tokenExpiryDate, refreshToken: $refreshToken, refTokenExpiryDate: $refTokenExpiryDate}';
  }
}
