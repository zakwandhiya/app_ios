import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_homepage_model.dart';
import '../model/get_homepage_model.dart';
import '../bloc/homepage_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_homepage_model.dart';

class HomepageRepository {
  final http.Client client;

  HomepageRepository({required this.client});

  Future<GetHomepageState> requestGetHomepage() async {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetHomepageJWTError(message: message);
    }
    var request = http.MultipartRequest('GET', Uri.parse('${NetworkUtils.baseUrl()}/user_home_data/$userId'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return GetHomepageInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();

      var getHomepageList = json.decode(body);
      GetHomepageResponseModel getHomepageTmp = GetHomepageResponseModel.fromJson(getHomepageList);
      return GetHomepageSuccess(getHomepageResponseModel: getHomepageTmp);
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return GetHomepageClientError(message: message);
    } else {
      String message = "Server Error";
      return GetHomepageServerError(message: message);
    }
  }

  Future<SubmitHomepageState> requestSubmitHomepage({
    required String id,
    required String value1,
    required String value2,
    required String value3,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse('${NetworkUtils.baseUrl()}/produk_masuk'));

    String? token = StorageUtils.getAccessToken();
    if (token == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return SubmitHomepageJWTError(message: message);
    }

    var headers = {
      'Authorization': token,
    };
    request.headers.addAll(headers);

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
      return SubmitHomepageInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();

      var submitHomepageList = json.decode(body);
      SubmitHomepageResponseModel submitHomepageTmp = SubmitHomepageResponseModel.fromJson(submitHomepageList);
      return SubmitHomepageSuccess(submitHomepageResponseModel: submitHomepageTmp);
    } else if (response.statusCode == 401) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      try {
        String body = await response.stream.bytesToString();
        return SubmitHomepageJWTError(message: json.decode(body)["message"]);
      } catch (e) {
        return SubmitHomepageJWTError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      try {
        String body = await response.stream.bytesToString();
        return SubmitHomepageClientError(message: json.decode(body)["message"]);
      } catch (e) {
        return SubmitHomepageClientError(message: message);
      }
    } else {
      String message = "Server Error";
      try {
        String body = await response.stream.bytesToString();
        message = json.decode(body)["message"];
      } catch (e) {}
      return SubmitHomepageServerError(message: message);
    }
  }

  Future<DeleteHomepageState> requestDeleteHomepage({
    required String id,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse('${NetworkUtils.baseUrl()}/produk_masuk'));

    String? token = StorageUtils.getAccessToken();
    if (token == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteHomepageJWTError(message: message);
    }

    var headers = {
      'Authorization': token,
    };
    request.headers.addAll(headers);

    request.fields.addAll({
      'id': '',
    });

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteHomepageInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();

      var deleteHomepageList = json.decode(body);
      DeleteHomepageResponseModel deleteHomepageTmp = DeleteHomepageResponseModel.fromJson(deleteHomepageList);
      return DeleteHomepageSuccess(deleteHomepageResponseModel: deleteHomepageTmp);
    } else if (response.statusCode == 401) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      try {
        String body = await response.stream.bytesToString();
        return DeleteHomepageJWTError(message: json.decode(body)["message"]);
      } catch (e) {
        return DeleteHomepageJWTError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      try {
        String body = await response.stream.bytesToString();
        return DeleteHomepageClientError(message: json.decode(body)["message"]);
      } catch (e) {
        return DeleteHomepageClientError(message: message);
      }
    } else {
      String message = "Server Error";
      try {
        String body = await response.stream.bytesToString();
        message = json.decode(body)["message"];
      } catch (e) {}
      return DeleteHomepageServerError(message: message);
    }
  }
}
