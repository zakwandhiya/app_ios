import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_pengumuman_list_model.dart';
import '../model/get_pengumuman_list_model.dart';
import '../bloc/pengumuman_list_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_pengumuman_list_model.dart';

class PengumumanListRepository {
  final http.Client client;

  PengumumanListRepository({required this.client});

  Future<GetPengumumanListState> requestGetPengumumanList() async {
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/pengumuman'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetPengumumanListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getPengumumanListList = json.decode(body);
        GetPengumumanListResponseModel getPengumumanListTmp = GetPengumumanListResponseModel.fromJson(getPengumumanListList);
        return GetPengumumanListSuccess(getPengumumanListResponseModel: getPengumumanListTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetPengumumanListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetPengumumanListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetPengumumanListServerError(message: message);
    }
  }

  Future<SubmitPengumumanListState> requestSubmitPengumumanList(
    SubmitPengumumanListResponseModel submitPengumumanListTmp,
  ) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitPengumumanListJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    request.body = json.encode(submitPengumumanListTmp.toJson());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitPengumumanListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return SubmitPengumumanListSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitPengumumanListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitPengumumanListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitPengumumanListServerError(message: message);
    }
  }

  Future<DeletePengumumanListState> requestDeletePengumumanList({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeletePengumumanListJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeletePengumumanListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deletePengumumanListList = json.decode(body);
        DeletePengumumanListResponseModel deletePengumumanListTmp = DeletePengumumanListResponseModel.fromJson(deletePengumumanListList);
        return DeletePengumumanListSuccess(deletePengumumanListResponseModel: deletePengumumanListTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeletePengumumanListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeletePengumumanListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeletePengumumanListServerError(message: message);
    }
  }
}
