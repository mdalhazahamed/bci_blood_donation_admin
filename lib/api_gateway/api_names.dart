class ApiNames {
  static String get login => "api/v1/public/auth/login";
  static String get register => "api/v1/public/auth/register";
  static String get bloodDonors => "api/v1/public/users/blood-group";
  static String get addBloodBank => "api/v1/blood-bank/add";
  static String get getBloodBanks => "api/v1/public/blood-bank";

  static Map<String, String> get customErrorMsgApiMap => {
        "userLoginAPI": "Login system currently not found",
      };
}
