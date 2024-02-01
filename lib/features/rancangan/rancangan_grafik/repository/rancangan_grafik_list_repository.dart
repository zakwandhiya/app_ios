import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_rancangan_grafik_list_model.dart';
import '../model/get_rancangan_grafik_list_model.dart';
import '../bloc/rancangan_grafik_list_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_rancangan_grafik_list_model.dart';

class RancanganGrafikListRepository {
  final http.Client client;

  RancanganGrafikListRepository({required this.client});

  Future<GetRancanganGrafikListState> requestGetRancanganGrafikList() async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetRancanganGrafikListJWTError(message: message);
    }
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/ipk_sks?filter=user_id,eq,$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetRancanganGrafikListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getRancanganGrafikListList = json.decode(body);
        GetRancanganGrafikListResponseModel getRancanganGrafikListTmp = GetRancanganGrafikListResponseModel.fromJson(getRancanganGrafikListList);
        if (getRancanganGrafikListTmp.records.isNotEmpty) {
          return GetRancanganGrafikListSuccess(getRancanganGrafikListResponseModel: getRancanganGrafikListTmp);
        } else {
          return GetRancanganGrafikListEmpty();
        }
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetRancanganGrafikListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetRancanganGrafikListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetRancanganGrafikListServerError(message: message);
    }
  }

  Future<SubmitRancanganGrafikListState> requestSubmitRancanganGrafikList(
    SubmitRancanganGrafikListResponseModel submitRancanganGrafikListTmp,
  ) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitRancanganGrafikListJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    request.body = json.encode(submitRancanganGrafikListTmp.toJson());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitRancanganGrafikListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return SubmitRancanganGrafikListSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitRancanganGrafikListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitRancanganGrafikListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitRancanganGrafikListServerError(message: message);
    }
  }

  Future<DeleteRancanganGrafikListState> requestDeleteRancanganGrafikList({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteRancanganGrafikListJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteRancanganGrafikListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteRancanganGrafikListList = json.decode(body);
        DeleteRancanganGrafikListResponseModel deleteRancanganGrafikListTmp =
            DeleteRancanganGrafikListResponseModel.fromJson(deleteRancanganGrafikListList);
        return DeleteRancanganGrafikListSuccess(deleteRancanganGrafikListResponseModel: deleteRancanganGrafikListTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteRancanganGrafikListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteRancanganGrafikListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteRancanganGrafikListServerError(message: message);
    }
  }
}
