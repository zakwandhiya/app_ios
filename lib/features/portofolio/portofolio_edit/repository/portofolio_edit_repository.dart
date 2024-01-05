import 'package:bimo_app/features/portofolio/model/portofolio_item_model.dart';
import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_mata_kuliah_edit_model.dart';
import '../model/get_mata_kuliah_edit_model.dart';
import '../bloc/portofolio_edit_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class PortofolioEditRepository {
  final http.Client client;

  PortofolioEditRepository({required http.Client this.client});

  Future<AddPortofolioEditState> requestAddPortofolioEdit(
    PortofolioItemModel portofolioItemModel,
  ) async {
    String? user_id = await StorageUtils.getUserId();
    if (user_id == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return AddPortofolioEditJWTError(message: message);
    }
    var request = http.Request('POST', Uri.parse(NetworkUtils.baseUrl() + '/portofolio'));

    portofolioItemModel.userId = int.parse(user_id);

    request.body = json.encode(portofolioItemModel.toJson());

    // request.body = json.encode({
    //   "user_id": 1,
    //   "nama_kegiatan": "pkmaba update 2",
    //   "kategori": "kepanitiaan",
    //   "jabatan": "peserta",
    //   "penyelenggara": "fakultas ilmu komputer",
    //   "tanggal_mulai": "September 2020",
    //   "tanggal_selesai": "Desember 2020"
    // });
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return AddPortofolioEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      print("-----------");
      try {
        return AddPortofolioEditSuccess(message: "tamabah portofolio berhasil");
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return AddPortofolioEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return AddPortofolioEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return AddPortofolioEditServerError(message: message);
    }
  }

  Future<UpdatePortofolioEditState> requestUpdatePortofolioEdit(
    PortofolioItemModel portofolioItemModel,
  ) async {
    String? user_id = await StorageUtils.getUserId();
    if (user_id == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return UpdatePortofolioEditJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse(NetworkUtils.baseUrl() + '/portofolio/${portofolioItemModel.id}'));

    request.body = json.encode(portofolioItemModel.toJson());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return UpdatePortofolioEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return UpdatePortofolioEditSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return UpdatePortofolioEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return UpdatePortofolioEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return UpdatePortofolioEditServerError(message: message);
    }
  }

  Future<DeletePortofolioEditState> requestDeletePortofolioEdit({
    required String id,
  }) async {
    String? user_id = await StorageUtils.getUserId();
    if (user_id == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeletePortofolioEditJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse(NetworkUtils.baseUrl() + '/user_biodata/$user_id'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeletePortofolioEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deletePortofolioEditList = json.decode(body);
        DeletePortofolioEditResponseModel deletePortofolioEditTmp = DeletePortofolioEditResponseModel.fromJson(deletePortofolioEditList);
        return DeletePortofolioEditSuccess(deletePortofolioEditResponseModel: deletePortofolioEditTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeletePortofolioEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeletePortofolioEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeletePortofolioEditServerError(message: message);
    }
  }
}
