import '../model/delete_login_model.dart';
import '../model/get_login_model.dart';
import '../bloc/login_state.dart';

import '../../../utils/network_utils.dart';
import '../../../utils/storage_utils.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginRepository {
  final http.Client client;

  LoginRepository({required this.client});

  Future<SubmitLoginState> requestSubmitLogin({
    required String username,
    required String password,
  }) async {
    var request = http.MultipartRequest(
        'GET', Uri.parse('${NetworkUtils.baseUrl()}/user?filter=username,eq,$username&filter=password,eq,$password&include=id'));

    http.StreamedResponse response;
    try {
      response = await request.send();
      String body = await response.stream.bytesToString();
      print(body);
    } catch (e) {
      print("error internet");
      return SubmitLoginInternetError(message: "Periksa Koneksi Internet Anda");
    }
    return SubmitLoginServerError(message: "error");

    // if (response.statusCode == 200) {
    //   String body = await response.stream.bytesToString();
    //   var submitLoginData = json.decode(body);
    //   late int id;
    //   try {
    //     id = submitLoginData['records'][0]['id'];
    //   } catch (e) {
    //     String message = "Terjadi Kesalahan, Periksa kembali data anda";
    //     return SubmitLoginClientError(message: message);
    //   }
    //   StorageUtils.setUserId(id.toString());
    //   return SubmitLoginSuccess();
    // } else if (response.statusCode >= 402 && response.statusCode < 500) {
    //   String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
    //   return SubmitLoginClientError(message: message);
    // } else {
    //   String message = "Server Error";
    //   return SubmitLoginServerError(message: message);
    // }
  }

  Future<GetLoginState> requestGetLogin({
    required String id,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse('${NetworkUtils.baseUrl()}/produk_masuk'));

    String? token = StorageUtils.getAccessToken();
    if (token == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return GetLoginJWTError(message: message);
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
      return GetLoginInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();

      var getLoginList = json.decode(body);
      GetLoginResponseModel getLoginTmp = GetLoginResponseModel.fromJson(getLoginList);
      return GetLoginSuccess(getLoginResponseModel: getLoginTmp);
    } else if (response.statusCode == 401) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      try {
        String body = await response.stream.bytesToString();
        return GetLoginJWTError(message: json.decode(body)["message"]);
      } catch (e) {
        return GetLoginJWTError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      try {
        String body = await response.stream.bytesToString();
        return GetLoginClientError(message: json.decode(body)["message"]);
      } catch (e) {
        return GetLoginClientError(message: message);
      }
    } else {
      String message = "Server Error";
      try {
        String body = await response.stream.bytesToString();
        message = json.decode(body)["message"];
      } catch (e) {}
      return GetLoginServerError(message: message);
    }
  }

  Future<DeleteLoginState> requestDeleteLogin({
    required String id,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse('${NetworkUtils.baseUrl()}/produk_masuk'));

    String? token = StorageUtils.getAccessToken();
    if (token == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteLoginJWTError(message: message);
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
      return DeleteLoginInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();

      var deleteLoginList = json.decode(body);
      DeleteLoginResponseModel deleteLoginTmp = DeleteLoginResponseModel.fromJson(deleteLoginList);
      return DeleteLoginSuccess(deleteLoginResponseModel: deleteLoginTmp);
    } else if (response.statusCode == 401) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      try {
        String body = await response.stream.bytesToString();
        return DeleteLoginJWTError(message: json.decode(body)["message"]);
      } catch (e) {
        return DeleteLoginJWTError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      try {
        String body = await response.stream.bytesToString();
        return DeleteLoginClientError(message: json.decode(body)["message"]);
      } catch (e) {
        return DeleteLoginClientError(message: message);
      }
    } else {
      String message = "Server Error";
      try {
        String body = await response.stream.bytesToString();
        message = json.decode(body)["message"];
      } catch (e) {}
      return DeleteLoginServerError(message: message);
    }
  }
}
