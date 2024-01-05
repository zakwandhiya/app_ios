import 'package:bimo_app/features/milestone/milestone_detail/model/get_milestone_detail_model.dart';
import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_milestone_edit_model.dart';
import '../model/get_milestone_edit_model.dart';
import '../bloc/milestone_edit_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class MilestoneEditRepository {
  final http.Client client;

  MilestoneEditRepository({required this.client});

  Future<GetMilestoneEditState> requestGetMilestoneEdit() async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetMilestoneEditJWTError(message: message);
    }
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetMilestoneEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getMilestoneEditList = json.decode(body);
        GetMilestoneEditResponseModel getMilestoneEditTmp = GetMilestoneEditResponseModel.fromJson(getMilestoneEditList);
        return GetMilestoneEditSuccess(getMilestoneEditResponseModel: getMilestoneEditTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetMilestoneEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetMilestoneEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetMilestoneEditServerError(message: message);
    }
  }

  Future<SubmitMilestoneEditState> requestSubmitMilestoneEdit(
    GetMilestoneDetailResponseModel submitMilestoneEditTmp,
  ) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitMilestoneEditJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse('${NetworkUtils.baseUrl()}/milestone/$userId'));

    request.body = json.encode(submitMilestoneEditTmp.toJson2());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitMilestoneEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return SubmitMilestoneEditSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitMilestoneEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitMilestoneEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitMilestoneEditServerError(message: message);
    }
  }

  Future<DeleteMilestoneEditState> requestDeleteMilestoneEdit({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteMilestoneEditJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteMilestoneEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteMilestoneEditList = json.decode(body);
        DeleteMilestoneEditResponseModel deleteMilestoneEditTmp = DeleteMilestoneEditResponseModel.fromJson(deleteMilestoneEditList);
        return DeleteMilestoneEditSuccess(deleteMilestoneEditResponseModel: deleteMilestoneEditTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteMilestoneEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteMilestoneEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteMilestoneEditServerError(message: message);
    }
  }
}
