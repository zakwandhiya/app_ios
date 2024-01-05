import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_mata_kuliah_edit_model.dart';
import '../model/get_mata_kuliah_edit_model.dart';
import '../bloc/rancangan_mata_kuliah_edit_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_mata_kuliah_edit_model.dart';

class MataKuliahEditRepository {
  final http.Client client;

  MataKuliahEditRepository({required http.Client this.client});

  Future<GetMataKuliahEditState> requestGetMataKuliahEdit() async {
    String? user_id = await StorageUtils.getUserId();
    if (user_id == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetMataKuliahEditJWTError(message: message);
    }
    var request = http.MultipartRequest('GET', Uri.parse(NetworkUtils.baseUrl() + '/user_biodata/$user_id'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetMataKuliahEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getMataKuliahEditList = json.decode(body);
        GetMataKuliahEditResponseModel getMataKuliahEditTmp = GetMataKuliahEditResponseModel.fromJson(getMataKuliahEditList);
        return GetMataKuliahEditSuccess(getMataKuliahEditResponseModel: getMataKuliahEditTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetMataKuliahEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetMataKuliahEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetMataKuliahEditServerError(message: message);
    }
  }

  Future<SubmitMataKuliahEditState> requestSubmitMataKuliahEdit(
    SubmitMataKuliahEditResponseModel submitMataKuliahEditTmp,
  ) async {
    String? user_id = await StorageUtils.getUserId();
    if (user_id == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitMataKuliahEditJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse(NetworkUtils.baseUrl() + '/user_biodata/$user_id'));

    request.body = json.encode(submitMataKuliahEditTmp.toJson());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitMataKuliahEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return SubmitMataKuliahEditSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitMataKuliahEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitMataKuliahEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitMataKuliahEditServerError(message: message);
    }
  }

  Future<DeleteMataKuliahEditState> requestDeleteMataKuliahEdit({
    required String id,
  }) async {
    String? user_id = await StorageUtils.getUserId();
    if (user_id == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteMataKuliahEditJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse(NetworkUtils.baseUrl() + '/user_biodata/$user_id'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteMataKuliahEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteMataKuliahEditList = json.decode(body);
        DeleteMataKuliahEditResponseModel deleteMataKuliahEditTmp = DeleteMataKuliahEditResponseModel.fromJson(deleteMataKuliahEditList);
        return DeleteMataKuliahEditSuccess(deleteMataKuliahEditResponseModel: deleteMataKuliahEditTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteMataKuliahEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteMataKuliahEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteMataKuliahEditServerError(message: message);
    }
  }
}
