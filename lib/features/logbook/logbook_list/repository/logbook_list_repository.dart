import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_logbook_list_model.dart';
import '../model/get_logbook_list_model.dart';
import '../bloc/logbook_list_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_logbook_list_model.dart';

class LogbookListRepository {
  final http.Client client;

  LogbookListRepository({required this.client});

  Future<GetLogbookListState> requestGetLogbookList() async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetLogbookListJWTError(message: message);
    }
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/logbook?filter=user_id,eq,$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetLogbookListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getLogbookListList = json.decode(body);
        GetLogbookListResponseModel getLogbookListTmp = GetLogbookListResponseModel.fromJson(getLogbookListList);
        if (getLogbookListTmp.records.isNotEmpty) {
          return GetLogbookListSuccess(getLogbookListResponseModel: getLogbookListTmp);
        } else {
          return GetLogbookListEmpty();
        }
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetLogbookListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetLogbookListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetLogbookListServerError(message: message);
    }
  }

  Future<SubmitLogbookListState> requestSubmitLogbookList(
    SubmitLogbookListResponseModel submitLogbookListTmp,
  ) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitLogbookListJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    request.body = json.encode(submitLogbookListTmp.toJson());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitLogbookListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return SubmitLogbookListSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitLogbookListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitLogbookListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitLogbookListServerError(message: message);
    }
  }

  Future<DeleteLogbookListState> requestDeleteLogbookList({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteLogbookListJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteLogbookListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteLogbookListList = json.decode(body);
        DeleteLogbookListResponseModel deleteLogbookListTmp = DeleteLogbookListResponseModel.fromJson(deleteLogbookListList);
        return DeleteLogbookListSuccess(deleteLogbookListResponseModel: deleteLogbookListTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteLogbookListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteLogbookListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteLogbookListServerError(message: message);
    }
  }
}
