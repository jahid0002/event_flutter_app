import 'dart:convert';

import 'package:event_app/helper/shared_prefe/shared_prefe.dart';
import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/service/socket_service.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:event_app/view/screens/chat/chat_screen.dart';
import 'package:event_app/view/screens/chat/model/conversation_model.dart';
import 'package:event_app/view/screens/chat/model/message_model.dart';
import 'package:event_app/view/screens/chat/model/notification_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxInt currentIndex = 0.obs;

  Rx<ChatType> chatType = ChatType.chat.obs;

  //=================================== Notification Section ===============================

  Rx<Status> notificationStatus = Status.loading.obs;

  RxList<NotificationModel> notificationList = <NotificationModel>[].obs;

  Future<void> getAllNotification() async {
    var response = await ApiClient.getData(ApiUrl.getAllNotification);

    if (response.statusCode == 200 || response.statusCode == 201) {
      notificationList.value = List<NotificationModel>.from(
        response.body['data']['result'].map(
          (x) => NotificationModel.fromMap(x),
        ),
      );
      notificationStatus(Status.completed);
    } else {
      notificationStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  //====================== Accept Connection Request ================================
  RxBool isAccepted = false.obs;
  RxInt loadingIndex = 0.obs;

  Future<void> acceptConnectionRequest({
    required String userID,
    required int index,
  }) async {
    loadingIndex(index);
    isAccepted(true);

    var body = {};

    var response = await ApiClient.postData(
      ApiUrl.acceptConnection(userID),
      jsonEncode(body),
    );

    isAccepted(false);
    loadingIndex(0);

    if (response.statusCode == 200 || response.statusCode == 201) {
      getAllNotification();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // ======================  Chat Section ================================.

  //====================>> Get Connection List
  RxList<ConversationModel> conversationList = <ConversationModel>[].obs;
  Rx<Status> conversationStatus = Status.loading.obs;

  Future<void> getAllConversation() async {
    var response = await ApiClient.getData(ApiUrl.getConversation);
    if (response.statusCode == 200 || response.statusCode == 201) {
      conversationList.value = List<ConversationModel>.from(
        response.body['data']['data'].map((x) => ConversationModel.fromMap(x)),
      );
      conversationStatus(Status.completed);
    } else {
      conversationStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  //====================== >> Get Message List

  RxList<MessageModel> messageList = <MessageModel>[].obs;

  Rx<Status> messageStatus = Status.loading.obs;

  Future<void> getAllMessage({required String otherUserID}) async {
    var response = await ApiClient.getData(
      ApiUrl.getMessages(otherUserID: otherUserID),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      messageList.value = List<MessageModel>.from(
        response.body['data']['result']['messages'].map(
          (x) => MessageModel.fromMap(x),
        ),
      );
      messageStatus(Status.completed);
    } else {
      messageStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  //=================>>. SEND MESSAGE METHODE
  Rx<TextEditingController> messageController = TextEditingController().obs;

  // Future<void> sendMessage({required String receiverID}) async {
  //   if (messageController.value.text.isEmpty) {
  //     debugPrint('message is empty');
  //     return;
  //   }

  //   var body = {
  //     "text": messageController.value.text.trim(),
  //     "receiver": receiverID,
  //   };

  //   SocketApi.sendEvent('send-message', body);

  //   debugPrint('message sent');
  //   messageController.value.clear();
  //   getAllMessage(otherUserID: receiverID);
  // }

  Future<void> sendMessage({required String receiverID}) async {
    if (messageController.value.text.trim().isEmpty) {
      debugPrint('Message is empty');
      return;
    }
    final userID = await SharePrefsHelper.getString(AppConstants.userId);
    final text = messageController.value.text.trim();
    final messagePayload = {"text": text, "receiver": receiverID};

    // Local optimistic message add (optional UX improvement)
    final localTempMessage = MessageModel(
      text: text,
      msgByUserId: MsgByUserId(id: userID), // replace `yourUserID` accordingly
      createdAt: DateTime.now().toIso8601String(),
      messageType: 'manual',
    );
    messageList.insert(0, localTempMessage);

    // Clear input field
    messageController.value.clear();

    try {
      // Acknowledgement with timeout handling
      SocketApi.socket?.emitWithAck(
        'send-message',
        messagePayload,
        ack: (response) {
          if (response == null || response == false) {
            debugPrint('Server failed to acknowledge message.');
            handleFailedSocketSend(localTempMessage);
          } else {
            debugPrint('Message sent successfully');
          }
        },
        // Optional timeout
        // timeout: Duration(seconds: 5),
      );
    } catch (e) {
      debugPrint('Socket send error: $e');
      handleFailedSocketSend(localTempMessage);
    }
    getAllMessage(otherUserID: receiverID);
  }

  void handleFailedSocketSend(MessageModel failedMessage) {
    // Option 1: Show a resend icon in UI
    // failedMessage.isFailed = true;
    messageList.refresh(); // GetX reactive refresh

    // Option 2: Store in local DB/cache for retry later
    // Option 3: Retry automatically after some time
  }

  //=================== Get New Message ====================== >>

  getRealTimeMessage({required String otherUserID}) async {
    debugPrint('=======================>> new-message-$otherUserID');
    SocketApi.onEvent('message-$otherUserID', (value) {
      debugPrint('message received');
      getAllMessage(otherUserID: otherUserID);
    });
  }

  seenResponse({
    required String otherUserID,
    required String conversationID,
  }) async {
    var messagePayload = {
      "conversationId": conversationID,
      "msgByUserId": otherUserID,
    };
    //SocketApi.socket?.emit('message');
    SocketApi.socket?.emitWithAck(
      'message',
      messagePayload,
      ack: (response) {
        if (response == null || response == false) {
          debugPrint('Server failed to acknowledge message.');
        } else {
          debugPrint('Message sent successfully');
        }
      },
      // Optional timeout
      // timeout: Duration(seconds: 5),
    );
  }

  //   @override
  //   void onInit() {
  //     // TO DO: implement onInit.
  //     getAllConversation();
  //     super.onInit();
  //   }
}

class ReceiverInformation {
  final String? receiverId;
  final String? receiverName;
  final String? receiverImage;
  final String? conversationID;

  ReceiverInformation({
    this.receiverId,
    this.receiverName,
    this.receiverImage,
    this.conversationID,
  });
}
