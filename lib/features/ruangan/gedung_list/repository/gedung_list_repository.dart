import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_gedung_list_model.dart';
import '../model/get_gedung_list_model.dart';
import '../bloc/gedung_list_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_gedung_list_model.dart';

class GedungListRepository {
  final http.Client client;

  GedungListRepository({required this.client});

  Future<GetGedungListState> requestGetGedungList() async {
    // String? userId = StorageUtils.getUserId();
    // if (userId == null) {
    //   String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
    //   return GetGedungListJWTError(message: message);
    // }
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/dosen'));
    print("==========");
    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetGedungListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getGedungListList = json.decode(body);
        GetGedungListResponseModel getGedungListTmp = GetGedungListResponseModel.fromJson(getGedungListList);
        if (getGedungListTmp.records.isNotEmpty) {
          return GetGedungListSuccess(getGedungListResponseModel: getGedungListTmp);
        } else {
          return GetGedungListEmpty();
        }
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetGedungListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetGedungListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetGedungListServerError(message: message);
    }
  }

  Future<SubmitGedungListState> requestSubmitGedungList(
    SubmitGedungListResponseModel submitGedungListTmp,
  ) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitGedungListJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    request.body = json.encode(submitGedungListTmp.toJson());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitGedungListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return SubmitGedungListSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitGedungListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitGedungListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitGedungListServerError(message: message);
    }
  }

  Future<DeleteGedungListState> requestDeleteGedungList({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteGedungListJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteGedungListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteGedungListList = json.decode(body);
        DeleteGedungListResponseModel deleteGedungListTmp = DeleteGedungListResponseModel.fromJson(deleteGedungListList);
        return DeleteGedungListSuccess(deleteGedungListResponseModel: deleteGedungListTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteGedungListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteGedungListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteGedungListServerError(message: message);
    }
  }
}
