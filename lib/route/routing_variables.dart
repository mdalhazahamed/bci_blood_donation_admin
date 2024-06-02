class Navigation {
  static const String homePage = '/';

  static const String register = 'register';
  static const String addedBloodBank = 'addedBloodBank';
  static const String login = 'login';
  static const String signUp = 'signUp';

  //bloodDonor
  static const String bloodDonor = 'homePage';
  static const String bloodBank = 'bloodBank';
  static const String bloodGroup = 'bloodGroup';
}

class NativeMethods {
  static String get infoChannel => "com.wearefriends.common_channel";

  static String get imageChannel => "com.wearefriends.image_channel";

  static String get methodDeviceInfo => "getDeviceInfo";

  static String get methodGenerateQR => "getQRImage";

  static String get methodFileUploader => "uploadFile";

  static String get methodIOSMicPermission => "getMicPermission";

  static String get methodAudioConfig => "recordAudioConfig";

  static String get sharingChannel => "com.wearefriends.sharing_channel";

  static String get sharingMethod => "shareInvitation";
}
