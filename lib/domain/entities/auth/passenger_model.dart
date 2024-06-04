import 'package:wasla/app/shared/common/common_libs.dart';

final class PassengerModel extends Equatable {
  final int points;
  final String firstName;
  final String lastName;
  final String profile;
  final String userName;
  final String userId;
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
    required this.userId,
    required this.isAuthenticated,
    required this.connections,
    required this.tokens,
    required this.role,
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
      role: AppConstants.emptyString,
      userId: AppConstants.emptyString);

  PassengerModel copyWith({
    int? points,
    String? firstName,
    String? lastName,
    String? profile,
    String? userName,
    bool? isAuthenticated,
    Connections? connections,
    Tokens? tokens,
    String? role,
  }) {
    return PassengerModel(
      points: points ?? this.points,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profile: profile ?? this.profile,
      userName: userName ?? this.userName,
      userId: AppConstants.emptyString,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      connections: connections ?? this.connections,
      tokens: tokens ?? this.tokens,
      role: role ?? this.role,
    );
  }

  @override
  List<Object> get props => [
        points,
        firstName,
        lastName,
        profile,
        userName,
        userId,
        isAuthenticated,
        connections,
        tokens,
        role,
      ];

  @override
  String toString() {
    return 'PassengerModel{points: $points, firstName: $firstName, lastName: $lastName, profile: $profile, userName: $userName, userId: $userId, isAuthenticated: $isAuthenticated, connections: $connections, tokens: $tokens, role: $role}';
  }
}

final class Connections extends Equatable {
  final String email;
  final String phone;
  final bool emailConfirmed;
  final bool phoneConfirmed;

  const Connections(
      {required this.email,
      required this.phone,
      required this.emailConfirmed,
      required this.phoneConfirmed});

  factory Connections.empty() => const Connections(
        email: AppConstants.emptyString,
        phone: AppConstants.emptyString,
        emailConfirmed: false,
        phoneConfirmed: false,
      );

  Connections copyWith({
    String? email,
    String? phone,
    bool? emailConfirmed,
    bool? phoneConfirmed,
  }) {
    return Connections(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      emailConfirmed: emailConfirmed ?? this.emailConfirmed,
      phoneConfirmed: phoneConfirmed ?? this.phoneConfirmed,
    );
  }

  @override
  List<Object> get props => [email, phone, emailConfirmed, phoneConfirmed];

  @override
  String toString() {
    return 'Connections{email: $email, phone: $phone, emailConfirmed: $emailConfirmed, phoneConfirmed: $phoneConfirmed}';
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

  Tokens copyWith({
    String? token,
    String? tokenExpiryDate,
    String? refreshToken,
    String? refTokenExpiryDate,
  }) {
    return Tokens(
      token: token ?? this.token,
      tokenExpiryDate: tokenExpiryDate ?? this.tokenExpiryDate,
      refreshToken: refreshToken ?? this.refreshToken,
      refTokenExpiryDate: refTokenExpiryDate ?? this.refTokenExpiryDate,
    );
  }

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
