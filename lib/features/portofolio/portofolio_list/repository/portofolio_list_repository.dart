import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_portofolio_list_model.dart';
import '../model/get_portofolio_list_model.dart';
import '../bloc/portofolio_list_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_portofolio_list_model.dart';

class PortofolioListRepository {
  final http.Client client;

  PortofolioListRepository({required this.client});

  Future<GetPortofolioListState> requestGetPortofolioList() async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetPortofolioListJWTError(message: message);
    }
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/portofolio?filter=user_id,eq,$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetPortofolioListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getPortofolioListList = json.decode(body);
        GetPortofolioListResponseModel getPortofolioListTmp = GetPortofolioListResponseModel.fromJson(getPortofolioListList);
        if (getPortofolioListTmp.records.isNotEmpty) {
          return GetPortofolioListSuccess(getPortofolioListResponseModel: getPortofolioListTmp);
        } else {
          return GetPortofolioListEmpty();
        }
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetPortofolioListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetPortofolioListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetPortofolioListServerError(message: message);
    }
  }

  Future<SubmitPortofolioListState> requestSubmitPortofolioList(
    SubmitPortofolioListResponseModel submitPortofolioListTmp,
  ) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitPortofolioListJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    request.body = json.encode(submitPortofolioListTmp.toJson());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitPortofolioListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return SubmitPortofolioListSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitPortofolioListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitPortofolioListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitPortofolioListServerError(message: message);
    }
  }

  Future<DeletePortofolioListState> requestDeletePortofolioList({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeletePortofolioListJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeletePortofolioListInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deletePortofolioListList = json.decode(body);
        DeletePortofolioListResponseModel deletePortofolioListTmp = DeletePortofolioListResponseModel.fromJson(deletePortofolioListList);
        return DeletePortofolioListSuccess(deletePortofolioListResponseModel: deletePortofolioListTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeletePortofolioListClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeletePortofolioListClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeletePortofolioListServerError(message: message);
    }
  }
}
