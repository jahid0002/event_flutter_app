import 'package:event_app/view/screens/chat/chat_screen.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxInt currentIndex = 0.obs;

  Rx<ChatType> chatType = ChatType.chat.obs;
}
