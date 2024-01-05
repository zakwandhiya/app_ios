import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_milestone_detail_model.dart';
import '../model/get_milestone_detail_model.dart';
import '../bloc/milestone_detail_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_milestone_detail_model.dart';

class MilestoneDetailRepository {
  final http.Client client;

  MilestoneDetailRepository({required this.client});

  Future<GetMilestoneDetailState> requestGetMilestoneDetail() async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetMilestoneDetailJWTError(message: message);
    }
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/milestone/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetMilestoneDetailInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getMilestoneDetailList = json.decode(body);
        GetMilestoneDetailResponseModel getMilestoneDetailTmp = GetMilestoneDetailResponseModel.fromJson(getMilestoneDetailList);
        return GetMilestoneDetailSuccess(getMilestoneDetailResponseModel: getMilestoneDetailTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetMilestoneDetailClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetMilestoneDetailClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetMilestoneDetailServerError(message: message);
    }
  }

  Future<SubmitMilestoneDetailState> requestSubmitMilestoneDetail(
    SubmitMilestoneDetailResponseModel submitMilestoneDetailTmp,
  ) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitMilestoneDetailJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    request.body = json.encode(submitMilestoneDetailTmp.toJson());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitMilestoneDetailInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return SubmitMilestoneDetailSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitMilestoneDetailClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitMilestoneDetailClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitMilestoneDetailServerError(message: message);
    }
  }

  Future<DeleteMilestoneDetailState> requestDeleteMilestoneDetail({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteMilestoneDetailJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteMilestoneDetailInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteMilestoneDetailList = json.decode(body);
        DeleteMilestoneDetailResponseModel deleteMilestoneDetailTmp = DeleteMilestoneDetailResponseModel.fromJson(deleteMilestoneDetailList);
        return DeleteMilestoneDetailSuccess(deleteMilestoneDetailResponseModel: deleteMilestoneDetailTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteMilestoneDetailClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteMilestoneDetailClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteMilestoneDetailServerError(message: message);
    }
  }
}
