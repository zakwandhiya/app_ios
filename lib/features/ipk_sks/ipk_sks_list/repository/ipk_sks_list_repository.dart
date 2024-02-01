import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_ipk_sks_list_model.dart';
import '../model/get_ipk_sks_list_model.dart';
import '../bloc/ipk_sks_list_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_ipk_sks_list_model.dart';

class IpkSksListRepository {
  final http.Client client;

  IpkSksListRepository({required this.client});

  Future<GetIpkSksListState> requestGetIpkSksList() async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetIpkSksListJWTError(message: message);
    }
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/ipk_sks?filter=user_id,eq,$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetIpkSksListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getIpkSksListList = json.decode(body);
        GetIpkSksListResponseModel getIpkSksListTmp = GetIpkSksListResponseModel.fromJson(getIpkSksListList);
        if (getIpkSksListTmp.records.isNotEmpty) {
          return GetIpkSksListSuccess(getIpkSksListResponseModel: getIpkSksListTmp);
        } else {
          return GetIpkSksListEmpty();
        }
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetIpkSksListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetIpkSksListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetIpkSksListServerError(message: message);
    }
  }

  Future<SubmitIpkSksListState> requestSubmitIpkSksList(
    SubmitIpkSksListResponseModel submitIpkSksListTmp,
  ) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitIpkSksListJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    request.body = json.encode(submitIpkSksListTmp.toJson());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitIpkSksListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return SubmitIpkSksListSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitIpkSksListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitIpkSksListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitIpkSksListServerError(message: message);
    }
  }

  Future<DeleteIpkSksListState> requestDeleteIpkSksList({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteIpkSksListJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteIpkSksListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteIpkSksListList = json.decode(body);
        DeleteIpkSksListResponseModel deleteIpkSksListTmp = DeleteIpkSksListResponseModel.fromJson(deleteIpkSksListList);
        return DeleteIpkSksListSuccess(deleteIpkSksListResponseModel: deleteIpkSksListTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteIpkSksListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteIpkSksListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteIpkSksListServerError(message: message);
    }
  }
}
