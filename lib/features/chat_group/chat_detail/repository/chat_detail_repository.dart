import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_chat_detail_model.dart';
import '../model/get_chat_detail_model.dart';
import '../bloc/chat_detail_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class ChatDetailRepository {
  final http.Client client;

  ChatDetailRepository({required this.client});

  Future<GetChatDetailState> requestGetChatDetail({
    required int receiver_id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetChatDetailJWTError(message: message);
    }
    var request = http.MultipartRequest(
        'GET',
        Uri.parse('${NetworkUtils.baseUrl()}/chat?filter1=sender_id,eq,$userId&filter1=receiver_id,eq,$receiver_id&filter2=sender_id,eq,$receiver_id&filter2=receiver_id,eq,$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetChatDetailInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getChatDetailList = json.decode(body);
        GetChatDetailResponseModel getChatDetailTmp = GetChatDetailResponseModel.fromJson(getChatDetailList);
        return GetChatDetailSuccess(getChatDetailResponseModel: getChatDetailTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetChatDetailClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetChatDetailClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetChatDetailServerError(message: message);
    }
  }

  Future<SubmitChatDetailState> requestSubmitChatDetail({
    required int receiver_id,
    required String konten,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitChatDetailJWTError(message: message);
    }
    var request = http.Request('POST', Uri.parse('${NetworkUtils.baseUrl()}/chat'));

    request.body = json.encode({
      "sender_id": userId,
      "receiver_id": receiver_id,
      "konten": konten,
    });
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitChatDetailInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";

        String body = await response.stream.bytesToString();
        print(body);
        return SubmitChatDetailSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitChatDetailClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitChatDetailClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitChatDetailServerError(message: message);
    }
  }

  Future<DeleteChatDetailState> requestDeleteChatDetail({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteChatDetailJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteChatDetailInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteChatDetailList = json.decode(body);
        DeleteChatDetailResponseModel deleteChatDetailTmp = DeleteChatDetailResponseModel.fromJson(deleteChatDetailList);
        return DeleteChatDetailSuccess(deleteChatDetailResponseModel: deleteChatDetailTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteChatDetailClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteChatDetailClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteChatDetailServerError(message: message);
    }
  }
}
