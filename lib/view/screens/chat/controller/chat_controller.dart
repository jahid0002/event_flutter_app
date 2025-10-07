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

  RxInt notificationCount = 0.obs;

  Future<void> getAllNotification() async {
    var response = await ApiClient.getData(ApiUrl.getAllNotification);

    if (response.statusCode == 200 || response.statusCode == 201) {
      notificationList.value = List<NotificationModel>.from(
        response.body['data']['result'].map(
          (x) => NotificationModel.fromMap(x),
        ),
      );
      notificationCount(response.body['data']['meta']['total'] ?? 0);
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

  Rx<TextEditingController> searchController = TextEditingController().obs;

  //====================>> Get Connection List
  RxList<ConversationModel> conversationList = <ConversationModel>[].obs;
  Rx<Status> conversationStatus = Status.loading.obs;

  RxInt unreadMessageCount = 0.obs;

  Future<void> getAllConversation() async {
    var response =
        searchController.value.text.isEmpty
            ? await ApiClient.getData(ApiUrl.getConversation)
            : await ApiClient.getData(
              ApiUrl.getConversationWithSearch(
                searchTerm: searchController.value.text,
              ),
            );
    if (response.statusCode == 200 || response.statusCode == 201) {
      conversationList.value = List<ConversationModel>.from(
        response.body['data']['data'].map((x) => ConversationModel.fromMap(x)),
      );
      unreadMessageCount(
        response.body['data']['meta']['totalUnseenConversations'] ?? 0,
      );
      conversationStatus(Status.completed);
    } else {
      conversationStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  //====================== >> Get Message List.

  void loadChat(String newUserId) {
    otherUserID.value = newUserId;
    currentPage.value = 1;
    totalPage.value = 1;
    // messageList.clear();
    getAllMessage(page: 1);
  }

  RxString otherUserID = ''.obs;

  RxInt currentPage = 1.obs;
  RxInt totalPage = 1.obs;

  RxList<MessageModel> messageList = <MessageModel>[].obs;

  Rx<Status> messageStatus = Status.loading.obs;

  Future<void> getAllMessage({int? page = 1}) async {
    // messageStatus(Status.loading);
    //  messageList.clear();
    var response = await ApiClient.getData(
      ApiUrl.getMessages(otherUserID: otherUserID.value, page: page.toString()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var messages = List<MessageModel>.from(
        response.body['data']['result']['messages'].map(
          (x) => MessageModel.fromMap(x),
        ),
      );

      if (messages.isEmpty) {
        messageList.value = [];
        messageStatus(Status.completed);
        return;
      }

      if (page == 1) {
        messageList.value = messages;
      } else {
        messageList.addAll(messages);
      }

      totalPage(response.body['data']['meta']['totalPage']);

      debugPrint('total page ${totalPage.value}');

      seenMeesage(
        conversationID: response.body['data']['result']['conversationId'],
        otherUserID: otherUserID.value,
      );

      joinChat(otherUserID: otherUserID.value);

      messageStatus(Status.completed);
    } else {
      messageStatus(Status.error);
      ApiChecker.checkApi(response);
    }
  }

  ///=============================== Join Chat ====================.

  joinChat({required String otherUserID}) async {
    debugPrint('=======================>> join-chat-$otherUserID');

    var messagePayload = {"chatPartnerId": otherUserID};

    SocketApi.socket?.emitWithAck(
      'join-chat',
      messagePayload,
      ack: (response) {
        if (response == null || response == false) {
          debugPrint('Server failed to acknowledge join chat.');
        } else {
          debugPrint('join chat successfully');
        }
      },
    );
  }

  //=============================== Leave Chat ====================.
  leaveChat() async {
    debugPrint('=======================>> leave-chat');
    var messagePayload = {};

    SocketApi.socket?.emitWithAck(
      'leave-chat',
      messagePayload,
      ack: (response) {
        if (response == null || response == false) {
          debugPrint('Server failed to acknowledge join chat.');
        } else {
          debugPrint('join chat successfully');
        }
      },
    );
  }

  //============================ >> Seen Message Methode ===================

  seenMeesage({
    required String conversationID,
    required String otherUserID,
  }) async {
    debugPrint('conversation id $conversationID');
    debugPrint('other user id $otherUserID');

    var messagePayload = {
      "conversationId": conversationID,
      "msgByUserId": otherUserID,
    };
    //SocketApi.socket?.emit('message');
    SocketApi.socket?.emitWithAck(
      'seen',
      messagePayload,
      ack: (response) {
        if (response == null || response == false) {
          debugPrint('Server failed to acknowledge message seen.');
        } else {
          debugPrint('Message seen successfully');
        }
      },
    );

    debugPrint('====================== >>> seen message called');

    getAllConversation();
  }

  //============================= PAGINATION ==>>>>>>>>>
  Rx<ScrollController> messageScrollController = ScrollController().obs;

  RxBool isScrollToBottom = false.obs;

  loadMoreMessage() async {
    if (currentPage.value < totalPage.value) {
      currentPage(currentPage.value + 1);
      getAllMessage(page: currentPage.value);
    }
  }

  //=================>>. SEND MESSAGE METHODE
  Rx<TextEditingController> messageController = TextEditingController().obs;

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
    getAllMessage();
    getAllConversation();
  }

  void handleFailedSocketSend(MessageModel failedMessage) {
    // Option 1: Show a resend icon in UI
    // failedMessage.isFailed = true;
    messageList.refresh(); // GetX reactive refresh

    // Option 2: Store in local DB/cache for retry later
    // Option 3: Retry automatically after some time
  }

  //=================== Get New Message ====================== >>

  getRealTimeMessage() async {
    final userID = await SharePrefsHelper.getString(AppConstants.userId);

    debugPrint('=======================>> new-message-$otherUserID');
    SocketApi.onEvent('message-$userID', (value) {
      debugPrint('message received');

      debugPrint('message received=========>> $value');

      // NO NEED TO jsonDecode
      var newMessage = value;

      messageList.insert(0, MessageModel.fromMap(newMessage));
      // getAllConversation();

      if (otherUserID.isNotEmpty) {
        getAllMessage();
      } else {
        getAllConversation();
      }

      // getAllMessage();
    });
    // getAllMessage();
  }

  // seenResponse({
  //   required String otherUserID,
  //   required String conversationID,
  // }) async {
  //   if (conversationID.isEmpty) {
  //     debugPrint('conversation id is empty');
  //     return;
  //   }

  //   var messagePayload = {
  //     "conversationId": conversationID,
  //     "msgByUserId": otherUserID,
  //   };
  //   //SocketApi.socket?.emit('message');
  //   SocketApi.socket?.emitWithAck(
  //     'message',
  //     messagePayload,
  //     ack: (response) {
  //       if (response == null || response == false) {
  //         debugPrint('Server failed to acknowledge message seen.');
  //       } else {
  //         debugPrint('Message seen successfully');
  //       }
  //     },
  //     // Optional timeout
  //     // timeout: Duration(seconds: 5),
  //   );
  // }

  @override
  void onInit() {
    messageScrollController.value.addListener(() {
      if (messageScrollController.value.position.pixels ==
          messageScrollController.value.position.maxScrollExtent) {
        loadMoreMessage();
      }
    });

    super.onInit();
  }
}

class ReceiverInformation {
  final String? receiverId;
  final String? receiverName;
  final String? receiverImage;
  final String? conversationID;
  final bool? blockByMe;
  final bool? blockByOther;

  ReceiverInformation({
    this.receiverId,
    this.receiverName,
    this.receiverImage,
    this.conversationID,
    this.blockByMe,
    this.blockByOther,
  });
}
