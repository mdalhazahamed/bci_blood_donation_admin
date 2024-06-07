import 'dart:math';

import 'package:intl/intl.dart';
import 'registration_data.dart';

class DataFormatter {
  static List shuffle(List items) {
    var random = new Random();

    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }

  static String getStringDate(DateTime? dateTime) {
    if (dateTime == null) return "";
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static bool validateEmail(final String email) {
    bool isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+").hasMatch(email);

    return isEmailValid;
    // “^([\w.-]+)@([\w-]+)((.(\w){2,3})+)$“/
  }

  static bool validateUsername(final String username) {
    return RegExp(
      r"^([a-zA-Z0-9]{3,32})$",
      caseSensitive: false,
      multiLine: false,
    ).hasMatch(username);
  }
}

class WKey {
  static Map getArgs(final RegistrationData registrationData) {
    return {WKey.regDataKey: registrationData};
  }

  static String get regDataKey => "registration_data";
  static String get resetUserNameKey => "reset_username";
  static String get uploadProfilePictureKey => "profile_picture_key";
  static String get loginAuthorizationKey => "authorization_key";
  static String get loginBirthDteKey => "date_birth_key";
  static String get loginMemberIdentifierKey => "member_id_key";
  static String get loginRefreshKey => "refresh_key";
  static String get uploadFeedVideoKey => "feed_video_key";
  static String get uploadVoiceRecordingKey => "voice_record_key";
  static String get symbolsKey => "symbol_list";
  static String get userNameKey => "user_name";
  static String get nameKey => "name";
  static String get userMailKey => "mail_key";
  static String get profileUrlKey => "profile_url";
  static String get feelingDateKey => "feelings_popup";
  static String get greetingYearKey => "birthday_greeting_year";
  static String get guardianLoggedInStatus => "is_guardian_logged_in";
  static String get libraryMbbsFolderNameKey => "mbbs_library_folders";
  static String get darkThemeStatus => "is_dark_theme";
}
