import 'package:bimo_app/features/profile/profile_detail/model/get_profile_detail_model.dart';
import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_profile_edit_model.dart';
import '../model/get_profile_edit_model.dart';
import '../bloc/profile_edit_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class ProfileEditRepository {
  final http.Client client;

  ProfileEditRepository({required this.client});

  Future<GetProfileEditState> requestGetProfileEdit() async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetProfileEditJWTError(message: message);
    }
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetProfileEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();
        var getProfileEditList = json.decode(body);
        GetProfileEditResponseModel getProfileEditTmp = GetProfileEditResponseModel.fromJson(getProfileEditList);
        return GetProfileEditSuccess(getProfileEditResponseModel: getProfileEditTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return GetProfileEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetProfileEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return GetProfileEditServerError(message: message);
    }
  }

  Future<SubmitProfileEditState> requestSubmitProfileEdit(GetProfileDetailResponseModel getProfileDetailResponseModel) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitProfileEditJWTError(message: message);
    }
    int id = getProfileDetailResponseModel.id;
    var request = http.Request('PUT', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$id'));

    request.body = json.encode(getProfileDetailResponseModel.toJson2());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return SubmitProfileEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = "update FeatureUppercase berhasil";
        return SubmitProfileEditSuccess(message: body);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return SubmitProfileEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return SubmitProfileEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return SubmitProfileEditServerError(message: message);
    }
  }

  Future<DeleteProfileEditState> requestDeleteProfileEdit({
    required String id,
  }) async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteProfileEditJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse('${NetworkUtils.baseUrl()}/user_biodata/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteProfileEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteProfileEditList = json.decode(body);
        DeleteProfileEditResponseModel deleteProfileEditTmp = DeleteProfileEditResponseModel.fromJson(deleteProfileEditList);
        return DeleteProfileEditSuccess(deleteProfileEditResponseModel: deleteProfileEditTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteProfileEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteProfileEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteProfileEditServerError(message: message);
    }
  }
}
