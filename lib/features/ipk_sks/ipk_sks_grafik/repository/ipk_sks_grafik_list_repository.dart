import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_ipk_sks_grafik_list_model.dart';
import '../model/get_ipk_sks_grafik_list_model.dart';
import '../bloc/ipk_sks_grafik_list_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_ipk_sks_grafik_list_model.dart';

class IpkSksGrafikListRepository {
  final http.Client client;

  IpkSksGrafikListRepository({required this.client});

  Future<GetIpkSksGrafikListState> requestGetIpkSksGrafikList() async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetIpkSksGrafikListJWTError(message: message);
    }
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/ipk_sks?filter=user_id,eq,$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetIpkSksGrafikListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getIpkSksGrafikListList = json.decode(body);
        GetIpkSksGrafikListResponseModel getIpkSksGrafikListTmp = GetIpkSksGrafikListResponseModel.fromJson(getIpkSksGrafikListList);
        if (getIpkSksGrafikListTmp.records.isNotEmpty) {
          return GetIpkSksGrafikListSuccess(getIpkSksGrafikListResponseModel: getIpkSksGrafikListTmp);
        } else {
          return GetIpkSksGrafikListEmpty();
        }
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetIpkSksGrafikListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetIpkSksGrafikListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetIpkSksGrafikListServerError(message: message);
    }
  }

  Future<SubmitIpkSksGrafikListState> requestSubmitIpkSksGrafikList(
    SubmitIpkSksGrafikListResponseModel submitIpkSksGrafikListTmp,
  ) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitIpkSksGrafikListJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    request.body = json.encode(submitIpkSksGrafikListTmp.toJson());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitIpkSksGrafikListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return SubmitIpkSksGrafikListSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitIpkSksGrafikListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitIpkSksGrafikListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitIpkSksGrafikListServerError(message: message);
    }
  }

  Future<DeleteIpkSksGrafikListState> requestDeleteIpkSksGrafikList({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteIpkSksGrafikListJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteIpkSksGrafikListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteIpkSksGrafikListList = json.decode(body);
        DeleteIpkSksGrafikListResponseModel deleteIpkSksGrafikListTmp = DeleteIpkSksGrafikListResponseModel.fromJson(deleteIpkSksGrafikListList);
        return DeleteIpkSksGrafikListSuccess(deleteIpkSksGrafikListResponseModel: deleteIpkSksGrafikListTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteIpkSksGrafikListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteIpkSksGrafikListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteIpkSksGrafikListServerError(message: message);
    }
  }
}
