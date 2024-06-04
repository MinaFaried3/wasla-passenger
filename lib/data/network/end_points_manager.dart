class EndPointsManager {
  // static const String baseUrl = "https://10.0.2.2:7095/api";
  // static const String baseUrl = "https://localhost:7095/api";
  static const String baseUrl = "https://wasla.runasp.net/api";

  //dirs
  static const String _authentication = "/auth";
  static const String _passengerAuth = "$_authentication/passenger";
  static const String _verification = "/verification";
  static const String _passanger = "/passanger";

  //endpoint
  //auth

  /// passenger dir
  static const String register = "$_passengerAuth/register";

  /// auth dir
  static const String login = "$_authentication/login";

  ///verification
  //edit
  static const String _edit = "$_verification/edit";
  static const String editPhone = "$_edit/phone";
  static const String editEmail = "$_edit/email";

  //send
  static const String _send = "$_verification/send";
  static const String sendMessage = "$_send/message";
  static const String sendEmail = "$_send/email/{email}";

  //confirm
  static const String _confirm = "$_verification/confirm";
  static const String confirmEmail = "$_confirm/email";

  //check
  static const String _check = "$_verification/check";
  static const String checkPhone = "$_check/phone";
  static const String checkEmail = "$_check/email";
  static const String checkUserName = "$_check/userName";

  //home
  static const String tripSuggestions = "$_passanger/tripsSuggestions";
}

class HeadersManager {
  static const String contentType = "Content-Type";
  static const String applicationJson = "application/json";
  static const String accept = "Accept";
  static const String acceptLanguage = "Accept-Language";
  static const String authorization = "Authorization";

  static const String ar = "ar-EG";
  static const String en = "en-US";

  static const Map<String, String> jsonTypeHeader = {
    contentType: applicationJson,
  };

  static Map<String, String> baseHeaders(String lang, String token) => {
        accept: applicationJson,
        authorization: "Bearer $token",
        acceptLanguage: lang,
      };
}
