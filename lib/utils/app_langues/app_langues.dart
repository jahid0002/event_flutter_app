// ignore_for_file: equal_keys_in_map

import 'package:get/get.dart';

/// Full application translations (English + Spanish)
/// Keys are English texts, values are translations.
/// Usage: Text("Login".tr)
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    // ---------------- English ----------------
    'en_US': {
      "Field can't be empty": "Field can't be empty",
      "Please enter your email": "Please enter your email",
      "Please enter your password": "Please enter your password",
      "Check network connection": "Check network connection",
      "Please Enter The 8 character": "Please Enter The 8 character",
      "Passwords do not match": "Passwords do not match",
      "No Data Found": "No Data Found",

      "Let's dive in into your account!": "Let's dive in into your account!",
      "Continue with Google": "Continue with Google",
      "Continue with Facebook": "Continue with Facebook",
      "Continue with Apple": "Continue with Apple",

      "Chat": "Chat",
      "Chats": "Chats",
      "Notifications": "Notifications",
      "Search Here...": "Search Here...",
      "No Conversation": "No Conversation",
      "No Notification": "No Notification",
      "Pending Connection": "Pending Connection",
      "Accept": "Accept",

      "Type a message": "Type a message",
      "N/A": "N/A",
      "You are blocked by this user": "You are blocked by this user",
      "You have blocked this user": "You have blocked this user",

      "Hi Mia!": "Hi Mia!",
      "Hello Sam!": "Hello Sam!",
      "How do you know Utsav Gandhi": "How do you know Utsav Gandhi",

      "Send": "Send",

      "Loading...": "Loading...",
      "Something went wrong": "Something went wrong",
      "No Internet Connection": "No Internet Connection",

      "Connections": "Connections",
      "No connection yet": "No connection yet",
      "00": "00",
      "Cancel Connection": "Cancel Connection",
      "Report User": "Report User",
      "Block User": "Block User",

      "About me": "About me",
      "About Me": "About Me",
      "Figma ipsum component variant main layer. Style style opacity italic asset share arrange. Arrange figjam effect polygon clip component content connection polygon. Share ":
          "Figma ipsum component variant main layer. Style style opacity italic asset share arrange. Arrange figjam effect polygon clip component content connection polygon. Share ",
      "Gender": "Gender",
      "From": "From",
      "My interests": "My interests",
      "Languages": "Languages",
      "Woman": "Woman",

      "Report": "Report",
      "Incident Type": "Incident Type",
      "Select Incident Type": "Select Incident Type",
      "Additional Note": "Additional Note",
      "Enter Additional Note": "Enter Additional Note",
      "Please select incident type": "Please select incident type",
      "Submit": "Submit",
      "Unprofessional Behavior": "Unprofessional Behavior",
      "Failure to collaborate": "Failure to collaborate",
      "Spam": "Spam",
      "Other": "Other",

      "No User Found": "No User Found",
      "Swiped Left": "Swiped Left",
      "Swiped Right": "Swiped Right",
      "Swiped Up!": "Swiped Up!",
      "Swiped Down!": "Swiped Down!",
      "No Interest": "No Interest",
      "Invite": "Invite",
      "Pending": "Pending",
      "Remove": "Remove",
      "Rejected": "Rejected",

      "My Album": "My Album",

      "Profile": "Profile",
      "App Language": "App Language",
      "Settings": "Settings",
      "N/A (not available)": "N/A",

      "Edit Profile": "Edit Profile",
      "Name": "Name",
      "John Doe": "John Doe",
      "Please enter your name": "Please enter your name",
      "Age": "Age",
      "Select your age": "Select your age",
      "MALE": "MALE",
      "FEMALE": "FEMALE",
      "Please enter your gender": "Please enter your gender",
      "Living in": "Living in",
      "Enter your country": "Enter your country",
      "Please enter your address": "Please enter your address",
      "My stay": "My stay",
      "25/10/1992": "25/10/1992",
      "Enter a short description about yourself and your interests":
          "Enter a short description about yourself and your interests",
      "Please enter your bio": "Please enter your bio",
      "Spanish": "Spanish",
      "English": "English",
      "Save": "Save",

      "Account & Security": "Account & Security",
      "Linked Accounts": "Linked Accounts",
      "Google": "Google",
      "Facebook": "Facebook",
      "Apple": "Apple",
      "RemoveLabel": "Remove",
      "Link": "Link",
      "Account Deletion": "Account Deletion",
      "Once you delete your account, all your data will be permanently removed.":
          "Once you delete your account, all your data will be permanently removed.",
      "Delete Account": "Delete Account",

      "Help & Support": "Help & Support",

      "NotificationsTitle": "Notifications",
      "General Notifications": "General Notifications",
      "Enable notifications for app updates, system alerts, and other important notifications.":
          "Enable notifications for app updates, system alerts, and other important notifications.",
      "Match Notifications": "Match Notifications",
      "Get notified when someone matches with you based on your profile preferences.":
          "Get notified when someone matches with you based on your profile preferences.",
      "Message Notifications": "Message Notifications",
      "Get notified when you receive new messages in the chat.":
          "Get notified when you receive new messages in the chat.",

      "Privacy Policy": "Privacy Policy",

      "Notification": "Notification",
      "Help & Support Section": "Help & Support",
      "Privacy Policy Section": "Privacy Policy",
      "Terms & Conditions": "Terms & Conditions",
      "Log Out": "Log Out",
      "Delete Account Button": "Delete Account",

      "Log Out Title": "Log Out",
      "Are you sure you want to log out?": "Are you sure you want to log out?",
      "Cancel": "Cancel",
      "Log Out Confirm": "Log Out",

      "Back": "Back",
      "How old are you?🎂": "How old are you?🎂",
      "We just need it to match you with the right people.":
          "We just need it to match you with the right people.",
      "Enter your age": "Enter your age",
      "Your age will be public": "Your age will be public",
      "Next": "Next",

      "Select Age": "Select Age",
      "Confirm": "Confirm",

      "Please enter your age": "Please enter your age",
      "Delete": "Delete",
      "Delete Account": "Delete Account",
      "Are you sure you want to delete your account? This action cannot be undone.":
          "Are you sure you want to delete your account? This action cannot be undone.",
      "Accept": "Accept",
      "You will never find them again.": "You will never find them again.",
      "Cancel": "Cancel",
      "Block": "Block",
    },

    // ---------------- Spanish ----------------
    'es_ES': {
      "Field can't be empty": "El campo no puede estar vacío",
      "Please enter your email": "Por favor, introduce tu correo electrónico",
      "Please enter your password": "Por favor, introduce tu contraseña",
      "Check network connection": "Verifica la conexión de red",
      "Please Enter The 8 character": "Por favor ingresa 8 caracteres",
      "Passwords do not match": "Las contraseñas no coinciden",
      "No Data Found": "No se encontraron datos",

      "Let's dive in into your account!": "¡Vamos a entrar en tu cuenta!",
      "Continue with Google": "Continuar con Google",
      "Continue with Facebook": "Continuar con Facebook",
      "Continue with Apple": "Continuar con Apple",

      "Chat": "Chat",
      "Chats": "Chats",
      "Notifications": "Notificaciones",
      "Search Here...": "Buscar aquí...",
      "No Conversation": "Sin conversación",
      "No Notification": "Sin notificación",
      "Pending Connection": "Conexión pendiente",
      "Accept": "Aceptar",

      "Type a message": "Escribe un mensaje",
      "N/A": "N/D",
      "You are blocked by this user": "Este usuario te ha bloqueado",
      "You have blocked this user": "Has bloqueado a este usuario",

      "Hi Mia!": "¡Hola Mia!",
      "Hello Sam!": "¡Hola Sam!",
      "How do you know Utsav Gandhi?": "¿Cómo conoces a Utsav Gandhi?",

      "Send": "Enviar",

      "Loading...": "Cargando...",
      "Something went wrong": "Algo salió mal",
      "No Internet Connection": "Sin conexión a Internet",

      "Connections": "Conexiones",
      "No connection yet": "Aún no hay conexión",
      "00": "00",
      "Cancel Connection": "Cancelar conexión",
      "Report User": "Reportar usuario",
      "Block User": "Bloquear usuario",

      "About me": "Sobre mí",
      "About Me": "Sobre mí",
      "Figma ipsum component variant main layer...":
          "Figma ipsum componente variante capa principal...",
      "Gender": "Género",
      "From": "De",
      "My interests": "Mis intereses",
      "Languages": "Idiomas",
      "Woman": "Mujer",

      "Report": "Reportar",
      "Incident Type": "Tipo de incidente",
      "Select Incident Type": "Seleccionar tipo de incidente",
      "Additional Note": "Nota adicional",
      "Enter Additional Note": "Ingrese nota adicional",
      "Please select incident type":
          "Por favor selecciona un tipo de incidente",
      "Submit": "Enviar",
      "Unprofessional Behavior": "Comportamiento poco profesional",
      "Failure to collaborate": "Falta de colaboración",
      "Spam": "Spam",
      "Other": "Otro",

      "No User Found": "No se encontraron usuarios",
      "Swiped Left": "Deslizó a la izquierda",
      "Swiped Right": "Deslizó a la derecha",
      "Swiped Up!": "¡Deslizó hacia arriba!",
      "Swiped Down!": "¡Deslizó hacia abajo!",
      "No Interest": "Sin interés",
      "Invite": "Invitar",
      "Pending": "Pendiente",
      "Remove": "Eliminar",
      "Rejected": "Rechazado",

      "My Album": "Mi álbum",

      "Profile": "Perfil",
      "App Language": "Idioma de la aplicación",
      "Settings": "Configuraciones",
      "N/A (not available)": "N/D",

      "Edit Profile": "Editar perfil",
      "Name": "Nombre",
      "John Doe": "John Doe",
      "Please enter your name": "Por favor, introduce tu nombre",
      "Age": "Edad",
      "Select your age": "Selecciona tu edad",
      "MALE": "HOMBRE",
      "FEMALE": "MUJER",
      "Please enter your gender": "Por favor, introduce tu género",
      "Living in": "Viviendo en",
      "Enter your country": "Introduce tu país",
      "Please enter your address": "Por favor, introduce tu dirección",
      "My stay": "Mi estancia",
      "25/10/1992": "25/10/1992",
      "Enter a short description about yourself and your interests":
          "Introduce una breve descripción sobre ti y tus intereses",
      "Please enter your bio": "Por favor, introduce tu biografía",
      "Spanish": "Español",
      "English": "Inglés",
      "Save": "Guardar",

      "Account & Security": "Cuenta y seguridad",
      "Linked Accounts": "Cuentas vinculadas",
      "Google": "Google",
      "Facebook": "Facebook",
      "Apple": "Apple",
      "RemoveLabel": "Eliminar",
      "Link": "Vincular",
      "Account Deletion": "Eliminación de cuenta",
      "Once you delete your account, all your data will be permanently removed.":
          "Una vez que elimines tu cuenta, todos tus datos se eliminarán permanentemente.",
      "Delete Account": "Eliminar cuenta",

      "Help & Support": "Ayuda y soporte",

      "NotificationsTitle": "Notificaciones",
      "General Notifications": "Notificaciones generales",
      "Enable notifications for app updates, system alerts, and other important notifications.":
          "Activa las notificaciones para actualizaciones de la aplicación, alertas del sistema y otras notificaciones importantes.",
      "Match Notifications": "Notificaciones de coincidencias",
      "Get notified when someone matches with you based on your profile preferences.":
          "Recibe una notificación cuando alguien coincida contigo según tus preferencias de perfil.",
      "Message Notifications": "Notificaciones de mensajes",
      "Get notified when you receive new messages in the chat.":
          "Recibe una notificación cuando recibas nuevos mensajes en el chat.",

      "Privacy Policy": "Política de privacidad",

      "Notification": "Notificación",
      "Help & Support Section": "Ayuda y soporte",
      "Privacy Policy Section": "Política de privacidad",
      "Terms & Conditions": "Términos y condiciones",
      "Log Out": "Cerrar sesión",
      "Delete Account Button": "Eliminar cuenta",

      "Log Out Title": "Cerrar sesión",
      "Are you sure you want to log out?":
          "¿Estás seguro de que quieres cerrar sesión?",
      "Cancel": "Cancelar",
      "Log Out Confirm": "Cerrar sesión",

      "Back": "Atrás",
      "How old are you?🎂": "¿Cuántos años tienes?🎂",
      "We just need it to match you with the right people.":
          "Solo lo necesitamos para emparejarte con las personas adecuadas.",
      "Enter your age": "Introduce tu edad",
      "Your age will be public": "Tu edad será pública",
      "Next": "Siguiente",

      "Select Age": "Seleccionar edad",
      "Confirm": "Confirmar",

      "Please enter your age": "Por favor, introduce tu edad",
      "Delete": "Eliminar",
      "Delete Account": "Eliminar cuenta",
      "Are you sure you want to delete your account? This action cannot be undone.":
          "¿Estás seguro de que deseas eliminar tu cuenta? Esta acción no se puede deshacer.",

      "Accept": "Aceptar",
      "You will never find them again.": "Nunca los volverás a encontrar.",
      "Cancel": "Cancelar",
      "Block": "Bloquear",
    },
  };
}

// class AppTranslations extends Translations {
//   @override
//   Map<String, Map<String, String>> get keys => {
//     'en_US': {
//       'fieldCantBeEmpty': "Field can't be empty",
//       'emailFieldCantBeEmpty': "Please enter your email",
//       'passwordFieldCantBeEmpty': "Please enter your password",
//       'checkNetworkConnection': "Check network connection",
//       'enterThe8Character': "Please Enter The 8 character",
//       'passwordNotMatch': "Passwords do not match",
//       'noDataFound': "No Data Found",

//       'letsDive': "Let's dive in into your account!",
//       'continueWithGoogle': "Continue with Google",
//       'continueWithFacebook': "Continue with Facebook",
//       'continueWithApple': "Continue with Apple",

//       'chat': "Chat",
//       'chats': "Chats",
//       'notifications': "Notifications",
//       'searchHere': "Search Here...",
//       'noConversation': "No Conversation",
//       'noNotification': "No Notification",
//       'pendingConnection': "Pending Connection",
//       'accept': "Accept",

//       'typeAMessage': "Type a message",
//       'na': "N/A",
//       'youAreBlocked': "You are blocked by this user",
//       'youHaveBlocked': "You have blocked this user",

//       'hiMia': "Hi Mia!",
//       'helloSam': "Hello Sam!",
//       'howDoYouKnow': "How do you know Utsav Gandhi",

//       'send': "Send",

//       'loading': "Loading...",
//       'errorOccurred': "Something went wrong",
//       'noInternet': "No Internet Connection",

//       'connections': "Connections",
//       'noConnectionYet': "No connection yet",
//       'defaultAge': "00",
//       'cancelConnection': "Cancel Connection",
//       'reportUser': "Report User",
//       'blockUser': "Block User",

//       'aboutMe': "About me",
//       'aboutMeTitle': "About Me",
//       'defaultBio':
//           "Figma ipsum component variant main layer. Style style opacity italic asset share arrange. Arrange figjam effect polygon clip component content connection polygon. Share ",
//       'gender': "Gender",
//       'from': "From",
//       'myInterests': "My interests",
//       'languages': "Languages",
//       'defaultGender': "Woman",

//       'report': "Report",
//       'incidentType': "Incident Type",
//       'selectIncidentType': "Select Incident Type",
//       'additionalNote': "Additional Note",
//       'enterAdditionalNote': "Enter Additional Note",
//       'pleaseSelectIncidentType': "Please select incident type",
//       'submit': "Submit",
//       'unprofessionalBehavior': "Unprofessional Behavior",
//       'failureToCollaborate': "Failure to collaborate",
//       'spam': "Spam",
//       'other': "Other",

//       'noUserFound': "No User Found",
//       'swipedLeft': "Swiped Left",
//       'swipedRight': "Swiped Right",
//       'swipedUp': "Swiped Up!",
//       'swipedDown': "Swiped Down!",
//       'noInterest': "No Interest",
//       'invite': "Invite",
//       'pending': "Pending",
//       'accepted':
//           "Remove", // Note: This might be confusing - "Remove" vs "Accepted"
//       'rejected': "Rejected",

//       'myAlbum': "My Album",

//       'profile': "Profile",
//       'appLanguage': "App Language",
//       'settings': "Settings",
//       'notAvailable': "N/A",

//       'editProfile': "Edit Profile",
//       'name': "Name",
//       'nameHint': "John Doe",
//       'pleaseEnterName': "Please enter your name",
//       'age': "Age",
//       'selectYourAge': "Select your age",
//       'male': "MALE",
//       'female': "FEMALE",
//       'pleaseEnterGender': "Please enter your gender",
//       'livingIn': "Living in",
//       'enterYourCountry': "Enter your country",
//       'pleaseEnterAddress': "Please enter your address",
//       'myStay': "My stay",
//       'defaultStayDate': "25/10/1992",
//       'aboutMeHint':
//           "Enter a short description about yourself and your interests",
//       'pleaseEnterBio': "Please enter your bio",
//       'spanish': "Spanish",
//       'english': "English",
//       'save': "Save",

//       'accountSecurityTitle': "Account & Security",
//       'linkedAccountsTitle': "Linked Accounts",
//       'googleLabel': "Google",
//       'facebookLabel': "Facebook",
//       'appleLabel': "Apple",
//       'removeLabel': "Remove",
//       'linkLabel': "Link",
//       'accountDeletionTitle': "Account Deletion",
//       'accountDeletionSubtitle':
//           "Once you delete your account, all your data will be permanently removed.",
//       'deleteAccountButton': "Delete Account",

//       'helpSupportTitle': "Help & Support",

//       'notificationsTitle': "Notifications",
//       'generalNotificationsTitle': "General Notifications",
//       'generalNotificationsSubtitle':
//           "Enable notifications for app updates, system alerts, and other important notifications.",
//       'matchNotificationsTitle': "Match Notifications",
//       'matchNotificationsSubtitle':
//           "Get notified when someone matches with you based on your profile preferences.",
//       'messageNotificationsTitle': "Message Notifications",
//       'messageNotificationsSubtitle':
//           "Get notified when you receive new messages in the chat.",

//       'privacyPolicyTitle': "Privacy Policy",

//       'notification': "Notification",
//       'helpSupport': "Help & Support",
//       'privacyPolicy': "Privacy Policy",
//       'termsConditions': "Terms & Conditions",
//       'logOut': "Log Out",
//       'deleteAccount': "Delete Account",

//       'logOutTitle': "Log Out",
//       'logOutMessage': "Are you sure you want to log out?",
//       'cancel': "Cancel",
//       'confirmLogOut': "Log Out",

//       'back': "Back",
//       'howOldAreYou': "How old are you?🎂",
//       'ageInfo': "We just need it to match you with the right people.",
//       'enterYourAge': "Enter your age",
//       'agePublic': "Your age will be public",
//       'next': "Next",

//       'selectAge': "Select Age",
//       'confirm': "Confirm",

//       'pleaseEnterYourAge': "Please enter your age",
//     },
//     'es_ES': {
//       'fieldCantBeEmpty': "El campo no puede estar vacío",
//       'emailFieldCantBeEmpty': "Por favor, introduce tu correo electrónico",
//       'passwordFieldCantBeEmpty': "Por favor, introduce tu contraseña",
//       'checkNetworkConnection': "Verifica la conexión de red",
//       'enterThe8Character': "Por favor ingresa 8 caracteres",
//       'passwordNotMatch': "Las contraseñas no coinciden",
//       'noDataFound': "No se encontraron datos",

//       'letsDive': "¡Vamos a entrar en tu cuenta!",
//       'continueWithGoogle': "Continuar con Google",
//       'continueWithFacebook': "Continuar con Facebook",
//       'continueWithApple': "Continuar con Apple",

//       'chat': "Chat",
//       'chats': "Chats",
//       'notifications': "Notificaciones",
//       'searchHere': "Buscar aquí...",
//       'noConversation': "Sin conversación",
//       'noNotification': "Sin notificación",
//       'pendingConnection': "Conexión pendiente",
//       'accept': "Aceptar",

//       'typeAMessage': "Escribe un mensaje",
//       'na': "N/D",
//       'youAreBlocked': "Este usuario te ha bloqueado",
//       'youHaveBlocked': "Has bloqueado a este usuario",

//       'hiMia': "¡Hola Mia!",
//       'helloSam': "¡Hola Sam!",
//       'howDoYouKnow': "¿Cómo conoces a Utsav Gandhi?",

//       'send': "Enviar",

//       'loading': "Cargando...",
//       'errorOccurred': "Algo salió mal",
//       'noInternet': "Sin conexión a Internet",

//       'connections': "Conexiones",
//       'noConnectionYet': "Aún no hay conexión",
//       'defaultAge': "00",
//       'cancelConnection': "Cancelar conexión",
//       'reportUser': "Reportar usuario",
//       'blockUser': "Bloquear usuario",

//       'aboutMe': "Sobre mí",
//       'aboutMeTitle': "Sobre mí",
//       'defaultBio':
//           "Figma ipsum componente variante capa principal. Estilo estilo opacidad cursiva recurso compartir organizar. Organizar figjam efecto polígono recorte componente contenido conexión polígono. Compartir ",
//       'gender': "Género",
//       'from': "De",
//       'myInterests': "Mis intereses",
//       'languages': "Idiomas",
//       'defaultGender': "Mujer",

//       'report': "Reportar",
//       'incidentType': "Tipo de incidente",
//       'selectIncidentType': "Seleccionar tipo de incidente",
//       'additionalNote': "Nota adicional",
//       'enterAdditionalNote': "Ingrese nota adicional",
//       'pleaseSelectIncidentType': "Por favor selecciona un tipo de incidente",
//       'submit': "Enviar",
//       'unprofessionalBehavior': "Comportamiento poco profesional",
//       'failureToCollaborate': "Falta de colaboración",
//       'spam': "Spam",
//       'other': "Otro",

//       'noUserFound': "No se encontraron usuarios",
//       'swipedLeft': "Deslizó a la izquierda",
//       'swipedRight': "Deslizó a la derecha",
//       'swipedUp': "¡Deslizó hacia arriba!",
//       'swipedDown': "¡Deslizó hacia abajo!",
//       'noInterest': "Sin interés",
//       'invite': "Invitar",
//       'pending': "Pendiente",
//       'accepted': "Eliminar", // Note: Same issue as English version
//       'rejected': "Rechazado",

//       'myAlbum': "Mi álbum",

//       'profile': "Perfil",
//       'appLanguage': "Idioma de la aplicación",
//       'settings': "Configuraciones",
//       'notAvailable': "N/D",

//       'editProfile': "Editar perfil",
//       'name': "Nombre",
//       'nameHint': "John Doe",
//       'pleaseEnterName': "Por favor, introduce tu nombre",
//       'age': "Edad",
//       'selectYourAge': "Selecciona tu edad",
//       'male': "HOMBRE",
//       'female': "MUJER",
//       'pleaseEnterGender': "Por favor, introduce tu género",
//       'livingIn': "Viviendo en",
//       'enterYourCountry': "Introduce tu país",
//       'pleaseEnterAddress': "Por favor, introduce tu dirección",
//       'myStay': "Mi estancia",
//       'defaultStayDate': "25/10/1992",
//       'aboutMeHint': "Introduce una breve descripción sobre ti y tus intereses",
//       'pleaseEnterBio': "Por favor, introduce tu biografía",
//       'spanish': "Español",
//       'english': "Inglés",
//       'save': "Guardar",

//       'accountSecurityTitle': "Cuenta y seguridad",
//       'linkedAccountsTitle': "Cuentas vinculadas",
//       'googleLabel': "Google",
//       'facebookLabel': "Facebook",
//       'appleLabel': "Apple",
//       'removeLabel': "Eliminar",
//       'linkLabel': "Vincular",
//       'accountDeletionTitle': "Eliminación de cuenta",
//       'accountDeletionSubtitle':
//           "Una vez que elimines tu cuenta, todos tus datos se eliminarán permanentemente.",
//       'deleteAccountButton': "Eliminar cuenta",

//       'helpSupportTitle': "Ayuda y soporte",

//       'notificationsTitle': "Notificaciones",
//       'generalNotificationsTitle': "Notificaciones generales",
//       'generalNotificationsSubtitle':
//           "Activa las notificaciones para actualizaciones de la aplicación, alertas del sistema y otras notificaciones importantes.",
//       'matchNotificationsTitle': "Notificaciones de coincidencias",
//       'matchNotificationsSubtitle':
//           "Recibe una notificación cuando alguien coincida contigo según tus preferencias de perfil.",
//       'messageNotificationsTitle': "Notificaciones de mensajes",
//       'messageNotificationsSubtitle':
//           "Recibe una notificación cuando recibas nuevos mensajes en el chat.",

//       'privacyPolicyTitle': "Política de privacidad",

//       'notification': "Notificación",
//       'helpSupport': "Ayuda y soporte",
//       'privacyPolicy': "Política de privacidad",
//       'termsConditions': "Términos y condiciones",
//       'logOut': "Cerrar sesión",
//       'deleteAccount': "Eliminar cuenta",

//       'logOutTitle': "Cerrar sesión",
//       'logOutMessage': "¿Estás seguro de que quieres cerrar sesión?",
//       'cancel': "Cancelar",
//       'confirmLogOut': "Cerrar sesión",

//       'back': "Atrás",
//       'howOldAreYou': "¿Cuántos años tienes?🎂",
//       'ageInfo':
//           "Solo lo necesitamos para emparejarte con las personas adecuadas.",
//       'enterYourAge': "Introduce tu edad",
//       'agePublic': "Tu edad será pública",
//       'next': "Siguiente",

//       'selectAge': "Seleccionar edad",
//       'confirm': "Confirmar",

//       'pleaseEnterYourAge': "Por favor, introduce tu edad",
//     },
//   };
// }

// import 'package:get/get.dart';

// class AppTranslations extends Translations {
//   @override
//   Map<String, Map<String, String>> get keys => {
//     'en_US': {
//       // Fixed: Changed from 'en' to 'en_US'
//       'fieldCantBeEmpty': "Field can't be empty",
//       'emailFieldCantBeEmpty': "Please enter your email",
//       'passwordFieldCantBeEmpty': "Please enter your password",
//       'checkNetworkConnection': "Check network connection",
//       'enterThe8Character': "Please Enter The 8 character",
//       'passwordNotMatch': "Passwords do not match",
//       'noDataFound': "No Data Found",

//       'letsDive': "Let's dive in into your account!",
//       'continueWithGoogle': "Continue with Google",
//       'continueWithFacebook': "Continue with Facebook",
//       'continueWithApple': "Continue with Apple",

//       'chat': "Chat",
//       'chats': "Chats",
//       'notifications': "Notifications",
//       'searchHere': "Search Here...",
//       'noConversation': "No Conversation",
//       'noNotification': "No Notification",
//       'pendingConnection': "Pending Connection",
//       'accept': "Accept",

//       'typeAMessage': "Type a message",
//       'na': "N/A",
//       'youAreBlocked': "You are blocked by this user",
//       'youHaveBlocked': "You have blocked this user",

//       'hiMia': "Hi Mia!",
//       'helloSam': "Hello Sam!",
//       'howDoYouKnow': "How do you know Utsav Gandhi",

//       'send': "Send",

//       'loading': "Loading...",
//       'errorOccurred': "Something went wrong",
//       'noInternet': "No Internet Connection",

//       'connections': "Connections",
//       'noConnectionYet': "No connection yet",
//       'defaultAge': "00",
//       'cancelConnection': "Cancel Connection",
//       'reportUser': "Report User",
//       'blockUser': "Block User",

//       'aboutMe': "About me",
//       'aboutMeTitle': "About Me",
//       'defaultBio':
//           "Figma ipsum component variant main layer. Style style opacity italic asset share arrange. Arrange figjam effect polygon clip component content connection polygon. Share ",
//       'gender': "Gender",
//       'from': "From",
//       'myInterests': "My interests",
//       'languages': "Languages", // This key was missing in your usage
//       'defaultGender': "Woman",

//       'report': "Report",
//       'incidentType': "Incident Type",
//       'selectIncidentType': "Select Incident Type",
//       'additionalNote': "Additional Note",
//       'enterAdditionalNote': "Enter Additional Note",
//       'pleaseSelectIncidentType': "Please select incident type",
//       'submit': "Submit",
//       'unprofessionalBehavior': "Unprofessional Behavior",
//       'failureToCollaborate': "Failure to collaborate",
//       'spam': "Spam",
//       'other': "Other",

//       'noUserFound': "No User Found",
//       'swipedLeft': "Swiped Left",
//       'swipedRight': "Swiped Right",
//       'swipedUp': "Swiped Up!",
//       'swipedDown': "Swiped Down!",
//       'noInterest': "No Interest",
//       'invite': "Invite",
//       'pending': "Pending",
//       'accepted': "Remove",
//       'rejected': "Rejected",

//       'myAlbum': "My Album",

//       'profile': "Profile",
//       'appLanguage': "App Language",
//       'settings': "Settings",
//       'notAvailable': "N/A",

//       'editProfile': "Edit Profile",
//       'name': "Name",
//       'nameHint': "John Doe",
//       'pleaseEnterName': "Please enter your name",
//       'age': "Age",
//       'selectYourAge': "Select your age",
//       'male': "MALE",
//       'female': "FEMALE",
//       'pleaseEnterGender': "Please enter your gender",
//       'livingIn': "Living in",
//       'enterYourCountry': "Enter your country",
//       'pleaseEnterAddress': "Please enter your address",
//       'myStay': "My stay",
//       'defaultStayDate': "25/10/1992",
//       'aboutMeHint':
//           "Enter a short description about yourself and your interests",
//       'pleaseEnterBio': "Please enter your bio",
//       'spanish': "Spanish",
//       'english': "English",
//       'save': "Save",

//       'accountSecurityTitle': "Account & Security",
//       'linkedAccountsTitle': "Linked Accounts",
//       'googleLabel': "Google",
//       'facebookLabel': "Facebook",
//       'appleLabel': "Apple",
//       'removeLabel': "Remove",
//       'linkLabel': "Link",
//       'accountDeletionTitle': "Account Deletion",
//       'accountDeletionSubtitle':
//           "Once you delete your account, all your data will be permanently removed.",
//       'deleteAccountButton': "Delete Account",

//       'helpSupportTitle': "Help & Support",

//       'notificationsTitle': "Notifications",
//       'generalNotificationsTitle': "General Notifications",
//       'generalNotificationsSubtitle':
//           "Enable notifications for app updates, system alerts, and other important notifications.",
//       'matchNotificationsTitle': "Match Notifications",
//       'matchNotificationsSubtitle':
//           "Get notified when someone matches with you based on your profile preferences.",
//       'messageNotificationsTitle': "Message Notifications",
//       'messageNotificationsSubtitle':
//           "Get notified when you receive new messages in the chat.",

//       'privacyPolicyTitle': "Privacy Policy",

//       'notification': "Notification",
//       'helpSupport': "Help & Support",
//       'privacyPolicy': "Privacy Policy",
//       'termsConditions': "Terms & Conditions",
//       'logOut': "Log Out",
//       'deleteAccount': "Delete Account",

//       'logOutTitle': "Log Out",
//       'logOutMessage': "Are you sure you want to log out?",
//       'cancel': "Cancel",
//       'confirmLogOut': "Log Out",

//       'back': "Back",
//       'howOldAreYou': "How old are you?🎂",
//       'ageInfo': "We just need it to match you with the right people.",
//       'enterYourAge': "Enter your age",
//       'agePublic': "Your age will be public",
//       'next': "Next",

//       'selectAge': "Select Age",
//       'confirm': "Confirm",

//       'pleaseEnterYourAge': "Please enter your age",
//     },
//     'es_ES': {
//       // Fixed: Changed from 'es' to 'es_ES'
//       "fieldCantBeEmpty": "El campo no puede estar vacío",
//       "emailFieldCantBeEmpty": "Por favor, introduce tu correo electrónico",
//       "passwordFieldCantBeEmpty": "Por favor, introduce tu contraseña",
//       "checkNetworkConnection": "Verifica la conexión de red",
//       "enterThe8Character": "Por favor ingresa 8 caracteres",
//       "passwordNotMatch": "Las contraseñas no coinciden",
//       "noDataFound": "No se encontraron datos",

//       "letsDive": "¡Vamos a entrar en tu cuenta!",
//       "continueWithGoogle": "Continuar con Google",
//       "continueWithFacebook": "Continuar con Facebook",
//       "continueWithApple": "Continuar con Apple",

//       "chat": "Chat",
//       "chats": "Chats",
//       "notifications": "Notificaciones",
//       "searchHere": "Buscar aquí...",
//       "noConversation": "Sin conversación",
//       "noNotification": "Sin notificación",
//       "pendingConnection": "Conexión pendiente",
//       "accept": "Aceptar",

//       "typeAMessage": "Escribe un mensaje",
//       "na": "N/D",
//       "youAreBlocked": "Este usuario te ha bloqueado",
//       "youHaveBlocked": "Has bloqueado a este usuario",

//       "hiMia": "¡Hola Mia!",
//       "helloSam": "¡Hola Sam!",
//       "howDoYouKnow": "¿Cómo conoces a Utsav Gandhi?",

//       "send": "Enviar",

//       "loading": "Cargando...",
//       "errorOccurred": "Algo salió mal",
//       "noInternet": "Sin conexión a Internet",

//       "connections": "Conexiones",
//       "noConnectionYet": "Aún no hay conexión",
//       "defaultAge": "00",
//       "cancelConnection": "Cancelar conexión",
//       "reportUser": "Reportar usuario",
//       "blockUser": "Bloquear usuario",

//       "aboutMe": "Sobre mí",
//       "aboutMeTitle": "Sobre mí",
//       "defaultBio":
//           "Figma ipsum componente variante capa principal. Estilo estilo opacidad cursiva recurso compartir organizar. Organizar figjam efecto polígono recorte componente contenido conexión polígono. Compartir ",
//       "gender": "Género",
//       "from": "De",
//       "myInterests": "Mis intereses",
//       "languages": "Idiomas", // Added missing key
//       "defaultGender": "Mujer",

//       "report": "Reportar",
//       "incidentType": "Tipo de incidente",
//       "selectIncidentType": "Seleccionar tipo de incidente",
//       "additionalNote": "Nota adicional",
//       "enterAdditionalNote": "Ingrese nota adicional",
//       "pleaseSelectIncidentType": "Por favor selecciona un tipo de incidente",
//       "submit": "Enviar",
//       "unprofessionalBehavior": "Comportamiento poco profesional",
//       "failureToCollaborate": "Falta de colaboración",
//       "spam": "Spam",
//       "other": "Otro",

//       "noUserFound": "No se encontraron usuarios",
//       "swipedLeft": "Deslizó a la izquierda",
//       "swipedRight": "Deslizó a la derecha",
//       "swipedUp": "¡Deslizó hacia arriba!",
//       "swipedDown": "¡Deslizó hacia abajo!",
//       "noInterest": "Sin interés",
//       "invite": "Invitar",
//       "pending": "Pendiente",
//       "accepted": "Eliminar",
//       "rejected": "Rechazado",

//       "myAlbum": "Mi álbum",

//       "profile": "Perfil",
//       "appLanguage": "Idioma de la aplicación",
//       "settings": "Configuraciones",
//       "notAvailable": "N/D",

//       "editProfile": "Editar perfil",
//       "name": "Nombre",
//       "nameHint": "John Doe",
//       "pleaseEnterName": "Por favor, introduce tu nombre",
//       "age": "Edad",
//       "selectYourAge": "Selecciona tu edad",
//       "male": "HOMBRE",
//       "female": "MUJER",
//       "pleaseEnterGender": "Por favor, introduce tu género",
//       "livingIn": "Viviendo en",
//       "enterYourCountry": "Introduce tu país",
//       "pleaseEnterAddress": "Por favor, introduce tu dirección",
//       "myStay": "Mi estancia",
//       "defaultStayDate": "25/10/1992",
//       "aboutMeHint": "Introduce una breve descripción sobre ti y tus intereses",
//       "pleaseEnterBio": "Por favor, introduce tu biografía",
//       "spanish": "Español",
//       "english": "Inglés",
//       "save": "Guardar",

//       "accountSecurityTitle": "Cuenta y seguridad",
//       "linkedAccountsTitle": "Cuentas vinculadas",
//       "googleLabel": "Google",
//       "facebookLabel": "Facebook",
//       "appleLabel": "Apple",
//       "removeLabel": "Eliminar",
//       "linkLabel": "Vincular",
//       "accountDeletionTitle": "Eliminación de cuenta",
//       "accountDeletionSubtitle":
//           "Una vez que elimines tu cuenta, todos tus datos se eliminarán permanentemente.",
//       "deleteAccountButton": "Eliminar cuenta",

//       "helpSupportTitle": "Ayuda y soporte",

//       "notificationsTitle": "Notificaciones",
//       "generalNotificationsTitle": "Notificaciones generales",
//       "generalNotificationsSubtitle":
//           "Activa las notificaciones para actualizaciones de la aplicación, alertas del sistema y otras notificaciones importantes.",
//       "matchNotificationsTitle": "Notificaciones de coincidencias",
//       "matchNotificationsSubtitle":
//           "Recibe una notificación cuando alguien coincida contigo según tus preferencias de perfil.",
//       "messageNotificationsTitle": "Notificaciones de mensajes",
//       "messageNotificationsSubtitle":
//           "Recibe una notificación cuando recibas nuevos mensajes en el chat.",

//       "privacyPolicyTitle": "Política de privacidad",

//       "notification": "Notificación",
//       "helpSupport": "Ayuda y soporte",
//       "privacyPolicy": "Política de privacidad",
//       "termsConditions": "Términos y condiciones",
//       "logOut": "Cerrar sesión",
//       "deleteAccount": "Eliminar cuenta",

//       "logOutTitle": "Cerrar sesión",
//       "logOutMessage": "¿Estás seguro de que quieres cerrar sesión?",
//       "cancel": "Cancelar",
//       "confirmLogOut": "Cerrar sesión",

//       "back": "Atrás",
//       "howOldAreYou": "¿Cuántos años tienes?🎂",
//       "ageInfo":
//           "Solo lo necesitamos para emparejarte con las personas adecuadas.",
//       "enterYourAge": "Introduce tu edad",
//       "agePublic": "Tu edad será pública",
//       "next": "Siguiente",

//       "selectAge": "Seleccionar edad",
//       "confirm": "Confirmar",

//       "pleaseEnterYourAge": "Por favor, introduce tu edad",
//     },
//   };
// }

// import 'package:get/get.dart';

// class AppTranslations extends Translations {
//   @override
//   Map<String, Map<String, String>> get keys => {
//     'en': {
//       'fieldCantBeEmpty': "Field can't be empty",
//       'emailFieldCantBeEmpty': "Please enter your email",
//       'passwordFieldCantBeEmpty': "Please enter your password",
//       'checkNetworkConnection': "Check network connection",
//       'enterThe8Character': "Please Enter The 8 character",
//       'passwordNotMatch': "Passwords do not match",
//       'noDataFound': "No Data Found",

//       'letsDive': "Let’s dive in into your account!",
//       'continueWithGoogle': "Continue with Google",
//       'continueWithFacebook': "Continue with Facebook",
//       'continueWithApple': "Continue with Apple",

//       'chat': "Chat",
//       'chats': "Chats",
//       'notifications': "Notifications",
//       'searchHere': "Search Here...",
//       'noConversation': "No Conversation",
//       'noNotification': "No Notification",
//       'pendingConnection': "Pending Connection",
//       'accept': "Accept",

//       'typeAMessage': "Type a message",
//       'na': "N/A",
//       'youAreBlocked': "You are blocked by this user",
//       'youHaveBlocked': "You have blocked this user",

//       'hiMia': "Hi Mia!",
//       'helloSam': "Hello Sam!",
//       'howDoYouKnow': "How do you know Utsav Gandhi",

//       'send': "Send",

//       'loading': "Loading...",
//       'errorOccurred': "Something went wrong",
//       'noInternet': "No Internet Connection",

//       'connections': "Connections",
//       'noConnectionYet': "No connection yet",
//       'defaultAge': "00",
//       'cancelConnection': "Cancel Connection",
//       'reportUser': "Report User",
//       'blockUser': "Block User",

//       'aboutMe': "About me",
//       'aboutMeTitle': "About Me",
//       'defaultBio':
//           "Figma ipsum component variant main layer. Style style opacity italic asset share arrange. Arrange figjam effect polygon clip component content connection polygon. Share ",
//       'gender': "Gender",
//       'from': "From",
//       'myInterests': "My interests",
//       'languages': "Languages",
//       'defaultGender': "Woman",

//       'report': "Report",
//       'incidentType': "Incident Type",
//       'selectIncidentType': "Select Incident Type",
//       'additionalNote': "Additional Note",
//       'enterAdditionalNote': "Enter Additional Note",
//       'pleaseSelectIncidentType': "Please select incident type",
//       'submit': "Submit",
//       'unprofessionalBehavior': "Unprofessional Behavior",
//       'failureToCollaborate': "Failure to collaborate",
//       'spam': "Spam",
//       'other': "Other",

//       'noUserFound': "No User Found",
//       'swipedLeft': "Swiped Left",
//       'swipedRight': "Swiped Right",
//       'swipedUp': "Swiped Up!",
//       'swipedDown': "Swiped Down!",
//       'noInterest': "No Interest",
//       'invite': "Invite",
//       'pending': "Pending",
//       'accepted': "Remove",
//       'rejected': "Rejected",

//       'myAlbum': "My Album",

//       'profile': "Profile",
//       'appLanguage': "App Language",
//       'settings': "Settings",
//       'notAvailable': "N/A",

//       'editProfile': "Edit Profile",
//       'name': "Name",
//       'nameHint': "John Doe",
//       'pleaseEnterName': "Please enter your name",
//       'age': "Age",
//       'selectYourAge': "Select your age",
//       'male': "MALE",
//       'female': "FEMALE",
//       'pleaseEnterGender': "Please enter your gender",
//       'livingIn': "Living in",
//       'enterYourCountry': "Enter your country",
//       'pleaseEnterAddress': "Please enter your address",
//       'myStay': "My stay",
//       'defaultStayDate': "25/10/1992",
//       'aboutMeHint':
//           "Enter a short description about yourself and your interests",
//       'pleaseEnterBio': "Please enter your bio",
//       'spanish': "Spanish",
//       'english': "English",
//       'save': "Save",

//       'accountSecurityTitle': "Account & Security",
//       'linkedAccountsTitle': "Linked Accounts",
//       'googleLabel': "Google",
//       'facebookLabel': "Facebook",
//       'appleLabel': "Apple",
//       'removeLabel': "Remove",
//       'linkLabel': "Link",
//       'accountDeletionTitle': "Account Deletion",
//       'accountDeletionSubtitle':
//           "Once you delete your account, all your data will be permanently removed.",
//       'deleteAccountButton': "Delete Account",

//       'helpSupportTitle': "Help & Support",

//       'notificationsTitle': "Notifications",
//       'generalNotificationsTitle': "General Notifications",
//       'generalNotificationsSubtitle':
//           "Enable notifications for app updates, system alerts, and other important notifications.",
//       'matchNotificationsTitle': "Match Notifications",
//       'matchNotificationsSubtitle':
//           "Get notified when someone matches with you based on your profile preferences.",
//       'messageNotificationsTitle': "Message Notifications",
//       'messageNotificationsSubtitle':
//           "Get notified when you receive new messages in the chat.",

//       'privacyPolicyTitle': "Privacy Policy",

//       'notification': "Notification",
//       'helpSupport': "Help & Support",
//       'privacyPolicy': "Privacy Policy",
//       'termsConditions': "Terms & Conditions",
//       'logOut': "Log Out",
//       'deleteAccount': "Delete Account",

//       'logOutTitle': "Log Out",
//       'logOutMessage': "Are you sure you want to log out?",
//       'cancel': "Cancel",
//       'confirmLogOut': "Log Out",

//       'back': "Back",
//       'howOldAreYou': "How old are you?🎂",
//       'ageInfo': "We just need it to match you with the right people.",
//       'enterYourAge': "Enter your age",
//       'agePublic': "Your age will be public",
//       'next': "Next",

//       'selectAge': "Select Age",
//       'confirm': "Confirm",

//       'pleaseEnterYourAge': "Please enter your age",
//     },
//     // এখানে স্প্যানিশ ভাষার জন্য স্ট্রিং গুলো যোগ করুন
//     'es': {
//       "@@locale": "es",
//       "fieldCantBeEmpty": "El campo no puede estar vacío",
//       "emailFieldCantBeEmpty": "Por favor, introduce tu correo electrónico",
//       "passwordFieldCantBeEmpty": "Por favor, introduce tu contraseña",
//       "checkNetworkConnection": "Verifica la conexión de red",
//       "enterThe8Character": "Por favor ingresa 8 caracteres",
//       "passwordNotMatch": "Las contraseñas no coinciden",
//       "noDataFound": "No se encontraron datos",

//       "letsDive": "¡Vamos a entrar en tu cuenta!",
//       "continueWithGoogle": "Continuar con Google",
//       "continueWithFacebook": "Continuar con Facebook",
//       "continueWithApple": "Continuar con Apple",

//       "chat": "Chat",
//       "chats": "Chats",
//       "notifications": "Notificaciones",
//       "searchHere": "Buscar aquí...",
//       "noConversation": "Sin conversación",
//       "noNotification": "Sin notificación",
//       "pendingConnection": "Conexión pendiente",
//       "accept": "Aceptar",

//       "typeAMessage": "Escribe un mensaje",
//       "na": "N/D",
//       "youAreBlocked": "Este usuario te ha bloqueado",
//       "youHaveBlocked": "Has bloqueado a este usuario",

//       "hiMia": "¡Hola Mia!",
//       "helloSam": "¡Hola Sam!",
//       "howDoYouKnow": "¿Cómo conoces a Utsav Gandhi?",

//       "send": "Enviar",

//       "loading": "Cargando...",
//       "errorOccurred": "Algo salió mal",
//       "noInternet": "Sin conexión a Internet",

//       "connections": "Conexiones",
//       "noConnectionYet": "Aún no hay conexión",
//       "defaultAge": "00",
//       "cancelConnection": "Cancelar conexión",
//       "reportUser": "Reportar usuario",
//       "blockUser": "Bloquear usuario",

//       "aboutMe": "Sobre mí",
//       "aboutMeTitle": "Sobre mí",
//       "defaultBio":
//           "Figma ipsum componente variante capa principal. Estilo estilo opacidad cursiva recurso compartir organizar. Organizar figjam efecto polígono recorte componente contenido conexión polígono. Compartir ",
//       "gender": "Género",
//       "from": "De",
//       "myInterests": "Mis intereses",
//       "languages": "Idiomas",
//       "defaultGender": "Mujer",

//       "report": "Reportar",
//       "incidentType": "Tipo de incidente",
//       "selectIncidentType": "Seleccionar tipo de incidente",
//       "additionalNote": "Nota adicional",
//       "enterAdditionalNote": "Ingrese nota adicional",
//       "pleaseSelectIncidentType": "Por favor selecciona un tipo de incidente",
//       "submit": "Enviar",
//       "unprofessionalBehavior": "Comportamiento poco profesional",
//       "failureToCollaborate": "Falta de colaboración",
//       "spam": "Spam",
//       "other": "Otro",

//       "noUserFound": "No se encontraron usuarios",
//       "swipedLeft": "Deslizó a la izquierda",
//       "swipedRight": "Deslizó a la derecha",
//       "swipedUp": "¡Deslizó hacia arriba!",
//       "swipedDown": "¡Deslizó hacia abajo!",
//       "noInterest": "Sin interés",
//       "invite": "Invitar",
//       "pending": "Pendiente",
//       "accepted": "Eliminar",
//       "rejected": "Rechazado",

//       "myAlbum": "Mi álbum",

//       "profile": "Perfil",
//       "appLanguage": "Idioma de la aplicación",
//       "settings": "Configuraciones",
//       "notAvailable": "N/D",

//       "editProfile": "Editar perfil",
//       "name": "Nombre",
//       "nameHint": "John Doe",
//       "pleaseEnterName": "Por favor, introduce tu nombre",
//       "age": "Edad",
//       "selectYourAge": "Selecciona tu edad",
//       "male": "HOMBRE",
//       "female": "MUJER",
//       "pleaseEnterGender": "Por favor, introduce tu género",
//       "livingIn": "Viviendo en",
//       "enterYourCountry": "Introduce tu país",
//       "pleaseEnterAddress": "Por favor, introduce tu dirección",
//       "myStay": "Mi estancia",
//       "defaultStayDate": "25/10/1992",
//       "aboutMeHint": "Introduce una breve descripción sobre ti y tus intereses",
//       "pleaseEnterBio": "Por favor, introduce tu biografía",
//       "spanish": "Español",
//       "english": "Inglés",
//       "save": "Guardar",

//       "accountSecurityTitle": "Cuenta y seguridad",
//       "linkedAccountsTitle": "Cuentas vinculadas",
//       "googleLabel": "Google",
//       "facebookLabel": "Facebook",
//       "appleLabel": "Apple",
//       "removeLabel": "Eliminar",
//       "linkLabel": "Vincular",
//       "accountDeletionTitle": "Eliminación de cuenta",
//       "accountDeletionSubtitle":
//           "Una vez que elimines tu cuenta, todos tus datos se eliminarán permanentemente.",
//       "deleteAccountButton": "Eliminar cuenta",

//       "helpSupportTitle": "Ayuda y soporte",

//       "notificationsTitle": "Notificaciones",
//       "generalNotificationsTitle": "Notificaciones generales",
//       "generalNotificationsSubtitle":
//           "Activa las notificaciones para actualizaciones de la aplicación, alertas del sistema y otras notificaciones importantes.",
//       "matchNotificationsTitle": "Notificaciones de coincidencias",
//       "matchNotificationsSubtitle":
//           "Recibe una notificación cuando alguien coincida contigo según tus preferencias de perfil.",
//       "messageNotificationsTitle": "Notificaciones de mensajes",
//       "messageNotificationsSubtitle":
//           "Recibe una notificación cuando recibas nuevos mensajes en el chat.",

//       "privacyPolicyTitle": "Política de privacidad",

//       "notification": "Notificación",
//       "helpSupport": "Ayuda y soporte",
//       "privacyPolicy": "Política de privacidad",
//       "termsConditions": "Términos y condiciones",
//       "logOut": "Cerrar sesión",
//       "deleteAccount": "Eliminar cuenta",

//       "logOutTitle": "Cerrar sesión",
//       "logOutMessage": "¿Estás seguro de que quieres cerrar sesión?",
//       "cancel": "Cancelar",
//       "confirmLogOut": "Cerrar sesión",

//       "back": "Atrás",
//       "howOldAreYou": "¿Cuántos años tienes?🎂",
//       "ageInfo":
//           "Solo lo necesitamos para emparejarte con las personas adecuadas.",
//       "enterYourAge": "Introduce tu edad",
//       "agePublic": "Tu edad será pública",
//       "next": "Siguiente",

//       "selectAge": "Seleccionar edad",
//       "confirm": "Confirmar",

//       "pleaseEnterYourAge": "Por favor, introduce tu edad",
//     },
//   };
// }
