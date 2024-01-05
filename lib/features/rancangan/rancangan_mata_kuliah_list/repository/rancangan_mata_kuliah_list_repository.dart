import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_mata_kuliah_list_model.dart';
import '../model/get_mata_kuliah_list_model.dart';
import '../bloc/rancangan_mata_kuliah_list_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_mata_kuliah_list_model.dart';

class MataKuliahListRepository {
  final http.Client client;

  MataKuliahListRepository({required this.client});

  Future<GetMataKuliahListState> requestGetMataKuliahList() async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetMataKuliahListJWTError(message: message);
    }
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/rancangan_mata_kuliah?filter=user_id,eq,$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetMataKuliahListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getMataKuliahListList = json.decode(body);
        GetMataKuliahListResponseModel getMataKuliahListTmp = GetMataKuliahListResponseModel.fromJson(getMataKuliahListList);
        if (getMataKuliahListTmp.records.isNotEmpty) {
          return GetMataKuliahListSuccess(getMataKuliahListResponseModel: getMataKuliahListTmp);
        } else {
          return GetMataKuliahListEmpty();
        }
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetMataKuliahListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetMataKuliahListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetMataKuliahListServerError(message: message);
    }
  }

  Future<SubmitMataKuliahListState> requestSubmitMataKuliahList(
    SubmitMataKuliahListResponseModel submitMataKuliahListTmp,
  ) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitMataKuliahListJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    request.body = json.encode(submitMataKuliahListTmp.toJson());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitMataKuliahListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return SubmitMataKuliahListSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitMataKuliahListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitMataKuliahListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitMataKuliahListServerError(message: message);
    }
  }

  Future<DeleteMataKuliahListState> requestDeleteMataKuliahList({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteMataKuliahListJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteMataKuliahListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteMataKuliahListList = json.decode(body);
        DeleteMataKuliahListResponseModel deleteMataKuliahListTmp = DeleteMataKuliahListResponseModel.fromJson(deleteMataKuliahListList);
        return DeleteMataKuliahListSuccess(deleteMataKuliahListResponseModel: deleteMataKuliahListTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteMataKuliahListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteMataKuliahListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteMataKuliahListServerError(message: message);
    }
  }
}
