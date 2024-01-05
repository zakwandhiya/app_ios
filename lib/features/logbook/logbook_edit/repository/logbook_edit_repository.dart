import 'package:bimo_app/features/logbook/model/logbook_item_model.dart';
import 'package:bimo_app/utils/network_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';

import '../model/delete_logbook_edit_model.dart';
import '../model/get_logbook_edit_model.dart';
import '../bloc/logbook_edit_state.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_logbook_edit_model.dart';

class LogbookEditRepository {
  final http.Client client;

  LogbookEditRepository({required http.Client this.client});

  Future<AddLogbookEditState> requestAddLogbookEdit(
    LogbookItemModel logbookItemModel,
  ) async {
    String? user_id = await StorageUtils.getUserId();
    if (user_id == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return AddLogbookEditJWTError(message: message);
    }
    var request = http.Request('POST', Uri.parse(NetworkUtils.baseUrl() + '/logbook'));

    logbookItemModel.userId = int.parse(user_id);

    request.body = json.encode(logbookItemModel.toJson());

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
      return AddLogbookEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      print("-----------");
      try {
        return AddLogbookEditSuccess(message: "tamabah logbook berhasil");
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return AddLogbookEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return AddLogbookEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return AddLogbookEditServerError(message: message);
    }
  }

  Future<UpdateLogbookEditState> requestUpdateLogbookEdit(
    LogbookItemModel logbookItemModel,
  ) async {
    String? user_id = await StorageUtils.getUserId();
    if (user_id == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return UpdateLogbookEditJWTError(message: message);
    }
    var request = http.Request('PUT', Uri.parse(NetworkUtils.baseUrl() + '/logbook/${logbookItemModel.id}'));

    request.body = json.encode(logbookItemModel.toJson());
    var headers = {'Content-Type': 'application/json'};
    request.headers.addAll(headers);

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return UpdateLogbookEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String message = "update berhasil";
        return UpdateLogbookEditSuccess(message: message);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return UpdateLogbookEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return UpdateLogbookEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";
      return UpdateLogbookEditServerError(message: message);
    }
  }

  Future<DeleteLogbookEditState> requestDeleteLogbookEdit({
    required String id,
  }) async {
    String? user_id = await StorageUtils.getUserId();
    if (user_id == null) {
      String message = "Terjadi kesalahan pada autentikasi, mohon login kembali";
      return DeleteLogbookEditJWTError(message: message);
    }
    var request = http.MultipartRequest('DELETE', Uri.parse(NetworkUtils.baseUrl() + '/user_biodata/$user_id'));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return DeleteLogbookEditInternetError(message: "Periksa Koneksi Internet Anda");
    }

    if (response.statusCode == 200) {
      try {
        String body = await response.stream.bytesToString();

        var deleteLogbookEditList = json.decode(body);
        DeleteLogbookEditResponseModel deleteLogbookEditTmp = DeleteLogbookEditResponseModel.fromJson(deleteLogbookEditList);
        return DeleteLogbookEditSuccess(deleteLogbookEditResponseModel: deleteLogbookEditTmp);
      } catch (e) {
        String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
        return DeleteLogbookEditClientError(message: message);
      }
    } else if (response.statusCode >= 402 && response.statusCode < 500) {
      String message = "Terjadi Kesalahan, Periksa kelengkapan data anda";
      return DeleteLogbookEditClientError(message: message);
    } else {
      String message = "Terjadi Kesalahan Pada Server";

      return DeleteLogbookEditServerError(message: message);
    }
  }
}
