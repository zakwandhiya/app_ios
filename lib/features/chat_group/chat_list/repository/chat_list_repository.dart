import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_chat_list_model.dart';
import '../model/get_chat_list_model.dart';
import '../bloc/chat_list_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_chat_list_model.dart';

class ChatListRepository {
  final http.Client client;

  ChatListRepository({required this.client});

  Future<GetChatListState> requestGetChatList() async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetChatListJWTError(message: message);
    }
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/user_home_data'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetChatListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getChatListList = json.decode(body);
        GetChatListResponseModel getChatListTmp = GetChatListResponseModel.fromJson(getChatListList);
        getChatListTmp.records.removeWhere((item) => item.id.toString() == userId);
        return GetChatListSuccess(getChatListResponseModel: getChatListTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetChatListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetChatListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetChatListServerError(message: message);
    }
  }

  Future<SubmitChatListState> requestSubmitChatList(
    SubmitChatListResponseModel submitChatListTmp,
  ) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitChatListJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    request.body = json.encode(submitChatListTmp.toJson());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitChatListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return SubmitChatListSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitChatListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitChatListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitChatListServerError(message: message);
    }
  }

  Future<DeleteChatListState> requestDeleteChatList({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteChatListJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteChatListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteChatListList = json.decode(body);
        DeleteChatListResponseModel deleteChatListTmp = DeleteChatListResponseModel.fromJson(deleteChatListList);
        return DeleteChatListSuccess(deleteChatListResponseModel: deleteChatListTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteChatListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteChatListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteChatListServerError(message: message);
    }
  }
}
