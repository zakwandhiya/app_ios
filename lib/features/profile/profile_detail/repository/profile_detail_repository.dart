import '../model/delete_profile_detail_model.dart';
import '../model/get_profile_detail_model.dart';
import '../bloc/profile_detail_state.dart';

import '../../../../utils/network_utils.dart';
import '../../../../utils/storage_utils.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_profile_detail_model.dart';

class ProfileDetailRepository {
  final http.Client client;

  ProfileDetailRepository({required this.client});

  Future<GetProfileDetailState> requestGetProfileDetail() async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetProfileDetailJWTError(message: message);
    }
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetProfileDetailInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getProfileDetailList = json.decode(body);
        GetProfileDetailResponseModel getProfileDetailTmp = GetProfileDetailResponseModel.fromJson(getProfileDetailList);
        return GetProfileDetailSuccess(getProfileDetailResponseModel: getProfileDetailTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetProfileDetailClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetProfileDetailClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetProfileDetailServerError(message: message);
    }
  }

  Future<SubmitProfileDetailState> requestSubmitProfileDetail({
    required String id,
    required String value1,
    required String value2,
    required String value3,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitProfileDetailJWTError(message: message);
    }
    var request = http.MultipartRequest('POST', Uri.parse('${NetworkUtils.baseUrl()}/produk_masuk'));

    request.fields.addAll({
      'id': id,
      'value1': value1,
      'value2': value2,
      'value3': value3,
    });

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitProfileDetailInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var submitProfileDetailList = json.decode(body);
        SubmitProfileDetailResponseModel submitProfileDetailTmp = SubmitProfileDetailResponseModel.fromJson(submitProfileDetailList);
        return SubmitProfileDetailSuccess(submitProfileDetailResponseModel: submitProfileDetailTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitProfileDetailClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitProfileDetailClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitProfileDetailServerError(message: message);
    }
  }

  Future<DeleteProfileDetailState> requestDeleteProfileDetail({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteProfileDetailJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/produk_masuk'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteProfileDetailInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteProfileDetailList = json.decode(body);
        DeleteProfileDetailResponseModel deleteProfileDetailTmp = DeleteProfileDetailResponseModel.fromJson(deleteProfileDetailList);
        return DeleteProfileDetailSuccess(deleteProfileDetailResponseModel: deleteProfileDetailTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteProfileDetailClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteProfileDetailClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteProfileDetailServerError(message: message);
    }
  }
}
