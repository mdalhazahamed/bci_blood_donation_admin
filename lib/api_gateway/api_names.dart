class ApiNames {
  static String get login => "api/v1/public/auth/login";
  static String get register => "api/v1/public/auth/register";
  static String get bloodDonors => "api/v1/public/users/blood-group";

  static Map<String, String> get customErrorMsgApiMap => {
        "userLoginAPI": "Login system currently not found",
      };
}
