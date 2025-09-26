class AppStrings {
  static RegExp passRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.{8,}$)');
  static RegExp emailRegexp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  static const String fieldCantBeEmpty = "Field can't be empty";
  static const String emailFieldCantBeEmpty = "Please enter your email";
  static const String passwordFieldCantBeEmpty = "Please enter your password";
  static const String checknetworkconnection = "Check network connection";
  static const String enterThe8Character = "Please Enter The 8 character";
  static const String passwordNotMatch = "Passwords do not match";
  static const String noDataFound = "No Data Found";

  //========= Selected Screen ===

  static const String letsDive = "Let’s dive in into your account!";
  static const String continueWithGoogle = "Continue with Google";
  static const String continueWithFacebook = "Continue with Facebook";
  static const String continueWithApple = "Continue with Apple";

  // ========= Chat Screen =========
  static const String chat = "Chat";
  static const String chats = "Chats";
  static const String notifications = "Notifications";
  static const String searchHere = "Search Here...";
  static const String noConversation = "No Conversation";
  static const String noNotification = "No Notification";
  static const String pendingConnection = "Pending Connection";
  static const String accept = "Accept";

  // General

  static const String typeAMessage = 'Type a message';
  static const String na = 'N/A';
  // Chat Screen
  static const String youAreBlocked = 'You are blocked by this user';
  static const String youHaveBlocked = 'You have blocked this user';

  // Example Messages
  static const String hiMia = 'Hi Mia!';
  static const String helloSam = 'Hello Sam!';
  static const String howDoYouKnow = 'How do you know Utsav Gandhi';

  // Button / Action
  static const String send = 'Send';

  // Error / Status
  static const String loading = 'Loading...';
  static const String errorOccurred = 'Something went wrong';
  static const String noInternet = 'No Internet Connection';

  //========================= Connection ===================.

  static const connections = "Connections";
  static const noConnectionYet = "No connection yet";

  static const defaultAge = "00";
  static const cancelConnection = "Cancel Connection";
  static const reportUser = "Report User";
  static const blockUser = "Block User";

  static const aboutMe = 'About me';
  static const aboutMeTitle = 'About Me';
  static const defaultBio =
      'Figma ipsum component variant main layer. Style style opacity italic asset share arrange. Arrange figjam effect polygon clip component content connection polygon. Share ';
  static const gender = 'Gender';
  static const from = 'From';
  static const myInterests = 'My intereses';
  static const languages = 'Languages';
  static const defaultGender = 'Woman';
}
