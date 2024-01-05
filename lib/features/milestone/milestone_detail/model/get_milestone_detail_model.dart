class GetMilestoneDetailResponseModel {
  int id;
  String targetPklPendaftaran;
  String targetPklPelaksaan;
  bool targetSkripsiStatus;
  String targetSkripsiSemhasSidang;
  String targetSkripsiProposal;
  String targetSkripsiPengerjaan;
  bool targetPklStatus;
  String kuliahCatatan_1;
  String kuliahCatatan_3;
  bool targetWisudaStatus;
  String dateModified;
  String kuliahCatatan_2;
  String targetWisudaPelaksanaan;
  String targetSkripsiPraproposal;
  int userId;
  String dateCreated;
  double kuliahTargetIpk;
  bool kuliahStatus;

  GetMilestoneDetailResponseModel({
    required this.id,
    required this.targetPklPendaftaran,
    required this.targetPklPelaksaan,
    required this.targetSkripsiStatus,
    required this.targetSkripsiSemhasSidang,
    required this.targetSkripsiProposal,
    required this.targetSkripsiPengerjaan,
    required this.targetPklStatus,
    required this.kuliahCatatan_1,
    required this.kuliahCatatan_3,
    required this.targetWisudaStatus,
    required this.dateModified,
    required this.kuliahCatatan_2,
    required this.targetWisudaPelaksanaan,
    required this.targetSkripsiPraproposal,
    required this.userId,
    required this.dateCreated,
    required this.kuliahTargetIpk,
    required this.kuliahStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "target_pkl_pendaftaran": targetPklPendaftaran,
      "target_pkl_pelaksaan": targetPklPelaksaan,
      "target_skripsi_status": targetSkripsiStatus,
      "target_skripsi_semhas_sidang": targetSkripsiSemhasSidang,
      "target_skripsi_proposal": targetSkripsiProposal,
      "target_skripsi_pengerjaan": targetSkripsiPengerjaan,
      "target_pkl_status": targetPklStatus,
      "kuliah_catatan_1": kuliahCatatan_1,
      "kuliah_catatan_3": kuliahCatatan_3,
      "target_wisuda_status": targetWisudaStatus,
      "date_modified": dateModified,
      "kuliah_catatan_2": kuliahCatatan_2,
      "target_wisuda_pelaksanaan": targetWisudaPelaksanaan,
      "target_skripsi_praproposal": targetSkripsiPraproposal,
      "user_id": userId,
      "date_created": dateCreated,
      "kuliah_target_ipk": kuliahTargetIpk,
      "kuliah_status": kuliahStatus,
    };
  }

  Map<String, String> toJson2() {
    return {
      "target_skripsi_status": targetSkripsiStatus.toString(),
      "target_wisuda_pelaksanaan": targetWisudaPelaksanaan,
      "target_skripsi_pengerjaan": targetSkripsiPengerjaan,
      "target_wisuda_status": targetWisudaStatus.toString(),
      "target_skripsi_proposal": targetSkripsiProposal,
      "target_pkl_pelaksaan": targetPklPelaksaan,
      "kuliah_catatan_3": kuliahCatatan_3,
      "kuliah_target_ipk": kuliahTargetIpk.toString(),
      "kuliah_catatan_1": kuliahCatatan_1,
      "kuliah_catatan_2": kuliahCatatan_2,
      "target_skripsi_semhas_sidang": targetSkripsiSemhasSidang,
      "target_pkl_status": targetPklStatus.toString(),
      "kuliah_status": kuliahStatus.toString(),
      "target_pkl_pendaftaran": targetPklPendaftaran,
      "target_skripsi_praproposal": targetSkripsiPraproposal,
    };
  }

  factory GetMilestoneDetailResponseModel.fromJson(Map<String, dynamic> data) {
    GetMilestoneDetailResponseModel getMilestoneDetailModel = GetMilestoneDetailResponseModel(
      id: data['id'],
      targetPklPendaftaran: data['target_pkl_pendaftaran'],
      targetPklPelaksaan: data['target_pkl_pelaksaan'],
      targetSkripsiStatus: data['target_skripsi_status'],
      targetSkripsiSemhasSidang: data['target_skripsi_semhas_sidang'],
      targetSkripsiProposal: data['target_skripsi_proposal'],
      targetSkripsiPengerjaan: data['target_skripsi_pengerjaan'],
      targetPklStatus: data['target_pkl_status'],
      kuliahCatatan_1: data['kuliah_catatan_1'],
      kuliahCatatan_3: data['kuliah_catatan_3'],
      targetWisudaStatus: data['target_wisuda_status'],
      dateModified: data['date_modified'],
      kuliahCatatan_2: data['kuliah_catatan_2'],
      targetWisudaPelaksanaan: data['target_wisuda_pelaksanaan'],
      targetSkripsiPraproposal: data['target_skripsi_praproposal'],
      userId: data['user_id'],
      dateCreated: data['date_created'],
      kuliahTargetIpk: data['kuliah_target_ipk'],
      kuliahStatus: data['kuliah_status'],
    );
    return getMilestoneDetailModel;
  }
}
