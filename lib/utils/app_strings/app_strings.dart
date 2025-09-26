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

  // ================= Report Screen =================
  static const String report = "Report";
  static const String incidentType = "Incident Type";
  static const String selectIncidentType = "Select Incident Type";
  static const String additionalNote = "Additional Note";
  static const String enterAdditionalNote = "Enter Additional Note";
  static const String pleaseSelectIncidentType = "Please select incident type";
  static const String submit = "Submit";

  static const String unprofessionalBehavior = "Unprofessional Behavior";
  static const String failureToCollaborate = "Failure to collaborate";
  static const String spam = "Spam";
  static const String other = "Other";

  // ================== Home Screen ==================
  static const String noUserFound = "No User Found";
  static const String swipedLeft = "Swiped Left";
  static const String swipedRight = "Swiped Right";
  static const String swipedUp = "Swiped Up!";
  static const String swipedDown = "Swiped Down!";

  static const String noInterest = "No Interest";
  static const String invite = "Invite";
  static const String pending = "Pending";
  static const String accepted = "Remove";
  static const String rejected = "Rejected";

  // ================== Other User Details Screen ==================

  static const String myAlbum = "My Album";

  // ================== Profile Screen ==================
  static const String profile = "Profile";
  static const String appLanguage = " App Language";
  static const String settings = "Settings";
  static const String notAvailable = "N/A";

  // ================== Update Profile ==================
  static const String editProfile = "Edit Profile";
  static const String name = "Name";
  static const String nameHint = "John Doe";
  static const String pleaseEnterName = "Please enter your name";

  static const String age = "Age";
  static const String selectYourAge = "Select your age";

  static const String male = "MALE";
  static const String female = "FEMALE";
  static const String pleaseEnterGender = "Please enter your gender";

  static const String livingIn = "Living in";
  static const String enterYourCountry = "Enter your country";
  static const String pleaseEnterAddress = "Please enter your address";

  static const String myStay = "My stay";
  static const String defaultStayDate = "25/10/1992";

  static const String aboutMeHint =
      "Enter a short description about yourself and your interests";
  static const String pleaseEnterBio = "Please enter your bio";

  static const String spanish = "Spanish";
  static const String english = "English";

  static const String save = "Save";
}
